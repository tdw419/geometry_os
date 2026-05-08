; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; debug_monitor.asm -- Debug Monitor Stub
;
; A small program that runs the debug protocol over Page 3 shared memory.
; The AI Terminal can attach to this program and inspect its state.
;
; Also serves as a template for adding debug stubs to other programs.
;
; Page 3 Debug Mailbox (0x0C00-0x0C2F):
;   0x0C00: DEBUG_MAGIC     (0xDB9900 = stub active)
;   0x0C01: DEBUG_PARENT_PID
;   0x0C02: DEBUG_CHILD_PID (this process)
;   0x0C03: DEBUG_COMMAND   (1=regs, 2=ram_read, 3=ping, 0=none)
;   0x0C04: DEBUG_STATUS    (0=idle, 1=cmd_pending, 2=response_ready)
;   0x0C05-0x0C24: DEBUG_RESPONSE (32 words)
;   0x0C25: DEBUG_ADDR      (for ram_read)
;   0x0C26: DEBUG_VALUE     (for ram_write / ram_read result)

#define DEBUG_MAGIC      0x0C00
#define DEBUG_PARENT_PID 0x0C01
#define DEBUG_CHILD_PID  0x0C02
#define DEBUG_COMMAND    0x0C03
#define DEBUG_STATUS     0x0C04
#define DEBUG_RESPONSE   0x0C05
#define DEBUG_ADDR       0x0C25
#define DEBUG_VALUE      0x0C26
#define DEBUG_HEARTBEAT   0x0C27
#define DEBUG_CHECKPOINT 0x0C28

LDI r14, 1
LDI r30, 0xFD00

; ── Draw something visible so we know it's running ──
LDI r13, 0x1A1A2E
FILL r13

; Draw "DEBUG" label
LDI r20, 0x1000
STRO r20, "Debug Monitor"
LDI r14, 10
LDI r0, 10
LDI r12, 0x1000
LDI r9, 0x00FF00
LDI r7, 0x1A1A2E
DRAWTEXT r14, r0, r12, r9, r7

; Draw a pulsing indicator
LDI r14, 100
LDI r0, 100
LDI r12, 20
LDI r9, 20

; ── Initialize debug mailbox ──
LDI r13, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r13

; Write our PID
GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r13

; Clear status and heartbeat
LDI r13, 0
LDI r20, DEBUG_STATUS
STORE r20, r13
LDI r20, DEBUG_COMMAND
STORE r20, r13
LDI r20, DEBUG_HEARTBEAT
STORE r20, r13

; Frame counter for pulsing indicator
LDI r4, 0

; ── Main loop ──
main_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r13, r20
    ADDI r13, 1
    STORE r20, r13

    ; Update checkpoint (approximate current PC)
    LDI r20, DEBUG_CHECKPOINT
    LDI r13, main_loop
    STORE r20, r13

    ; Pulse the indicator (color oscillates)
    LDI r4, 1
    ADD r4, r3          ; r3 = tick counter (reuse frame count)
    LDI r13, 0xFF4444
    ANDI r13, 0xFF
    SHLI r13, 16
    ORI r13, 0x4444FF
    ; Simplified: just draw a blue rect
    LDI r13, 0x4466FF
    LDI r14, 100
    LDI r0, 100
    LDI r12, 20
    LDI r9, 20
    RECTF r14, r0, r12, r9, r13

    ; ── Check for debug commands ──
    LDI r20, DEBUG_STATUS
    LOAD r22, r20
    CMPI r22, 1
    JZ r13, debug_handle_command  ; r13=0 means equal (status==1)
    ; Status != 1, no command pending
    JMP main_loop

debug_handle_command:
    ; Read the command into r22 (r22 is safe from CMPI)
    LDI r20, DEBUG_COMMAND
    LOAD r22, r20

    ; Save r13 because CMPI clobbers it
    PUSH r13

    ; Command 1 = dump registers
    CMPI r22, 1
    JNZ r13, try_cmd_ram_read

    ; Restore r13 (the actual register value) before dumping
    POP r13

    ; Dump registers to response buffer
    LDI r20, DEBUG_RESPONSE
    STORE r20, r13       ; r13 (real value)
    ADDI r20, 1
    LDI r23, 1          ; skip r13, start at r14
    STORE r20, r14       ; r14
    ADDI r20, 1
    STORE r20, r0       ; r0
    ADDI r20, 1
    STORE r20, r12       ; r12
    ADDI r20, 1
    STORE r20, r9       ; r9
    ADDI r20, 1
    STORE r20, r7       ; r7
    ADDI r20, 1
    STORE r20, r4       ; r4
    ADDI r20, 1
    STORE r20, r3       ; r3
    ADDI r20, 1
    STORE r20, r10       ; r10
    ADDI r20, 1
    ; r2-r31: just store zeros for now (can't read all regs easily)
    LDI r23, 0
    LDI r24, 23         ; remaining regs (r2-r31 = 23)
dump_loop:
    CMPI r24, 0
    JZ r13, dump_done
    STORE r20, r23      ; store 0
    ADDI r20, 1
    SUBI r24, 1
    JMP dump_loop
dump_done:
    ; Set status = 2 (response ready)
    LDI r13, 2
    LDI r20, DEBUG_STATUS
    STORE r20, r13
    JMP main_loop

try_cmd_ram_read:
    POP r13              ; clean up pushed r13 from command dispatch
    ; Command 2 = read RAM at address
    CMPI r22, 2
    JNZ r13, try_cmd_ping

    LDI r20, DEBUG_ADDR
    LOAD r21, r20       ; r21 = address to read
    ; Bounds check
    CMPI r21, 65536
    BGE r13, cmd_error
    LOAD r22, r21       ; r22 = value at that address
    LDI r20, DEBUG_RESPONSE
    STORE r20, r22      ; response[0] = value
    ; Also store the address for verification
    ADDI r20, 1
    STORE r20, r21      ; response[1] = address

    LDI r13, 2
    LDI r20, DEBUG_STATUS
    STORE r20, r13
    JMP main_loop

try_cmd_ping:
    ; Command 3 = ping (just acknowledge)
    CMPI r22, 3
    JNZ r13, cmd_error

    LDI r20, DEBUG_RESPONSE
    LDI r23, 0x504E4720 ; "PING " in hex
    STORE r20, r23

    LDI r13, 2
    LDI r20, DEBUG_STATUS
    STORE r20, r13
    JMP main_loop

cmd_error:
    ; Unknown command, set status to 0xFF (error)
    LDI r13, 0xFF
    LDI r20, DEBUG_STATUS
    STORE r20, r13
    JMP main_loop
