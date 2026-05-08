; DESCRIPTION: This GeOS assembly code tests a parent process that spawns a child process (`debug_monitor`) using SPAWNC and communicates with it via a mailbox at Page 3. The parent waits for the child to initialize, checks a magic value to confirm its presence, sends a PING command, waits for a PONG response, and then tests REGS communication, displaying results on the screen.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r0, 1
LDI r30, 0xFD00

; Clear screen
LDI r6, 0x101820
FILL r6

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r0, 10
LDI r8, 10
LDI r12, 0x1000
LDI r2, 0x00FF00
LDI r14, 0x101820
DRAWTEXT r0, r8, r12, r2, r14

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r0, 10
LDI r8, 30
LDI r12, 0x2000
LDI r2, 0xFFFFFF
LDI r14, 0x101820
DRAWTEXT r0, r8, r12, r2, r14

; Wait a bunch of frames for child to set up its debug stub
LDI r3, 60
wait_init:
    FRAME
    SUBI r3, 1
    CMPI r3, 0
    JNZ r6, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r0, 10
LDI r8, 50
CMPI r6, 0
JNZ r6, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r12, 0x2100
LDI r2, 0xFFFF00
LDI r14, 0x101820
DRAWTEXT r0, r8, r12, r2, r14

; ── Send PING command ──
LDI r6, 3
LDI r20, 0x0C03
STORE r20, r6         ; COMMAND = 3 (ping)
LDI r6, 1
LDI r20, 0x0C04
STORE r20, r6         ; STATUS = 1 (pending)

; Wait for response
LDI r15, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r6, ping_got
    SUBI r15, 1
    CMPI r15, 0
    JNZ r6, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r0, 10
LDI r8, 70
LDI r12, 0x2200
LDI r2, 0xFF4444
LDI r14, 0x101820
DRAWTEXT r0, r8, r12, r2, r14
JMP done

ping_got:
; Clear status
LDI r6, 0
LDI r20, 0x0C04
STORE r20, r6

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r0, 10
LDI r8, 70
CMPI r6, 0
JNZ r6, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r12, 0x2200
LDI r2, 0x44FF44
LDI r14, 0x101820
DRAWTEXT r0, r8, r12, r2, r14

; ── Now test REGS ──
LDI r6, 1
LDI r20, 0x0C03
STORE r20, r6
LDI r6, 1
LDI r20, 0x0C04
STORE r20, r6

LDI r15, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r6, regs_got
    SUBI r15, 1
    CMPI r15, 0
    JNZ r6, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r6, 0
LDI r20, 0x0C04
STORE r20, r6

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r0, 10
LDI r8, 90
LDI r12, 0x2300
LDI r2, 0x4488FF
LDI r14, 0x101820
DRAWTEXT r0, r8, r12, r2, r14

done:
FRAME
JMP done
