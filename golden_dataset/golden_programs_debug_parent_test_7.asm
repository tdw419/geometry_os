; DESCRIPTION: Draws a colored object at the screen with fixed size.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r1, 1
LDI r30, 0xFD00

; Clear screen
LDI r3, 0x101820
FILL r3

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r1, 10
LDI r12, 10
LDI r8, 0x1000
LDI r9, 0x00FF00
LDI r13, 0x101820
DRAWTEXT r1, r12, r8, r9, r13

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r1, 10
LDI r12, 30
LDI r8, 0x2000
LDI r9, 0xFFFFFF
LDI r13, 0x101820
DRAWTEXT r1, r12, r8, r9, r13

; Wait a bunch of frames for child to set up its debug stub
LDI r7, 60
wait_init:
    FRAME
    SUBI r7, 1
    CMPI r7, 0
    JNZ r3, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r1, 10
LDI r12, 50
CMPI r3, 0
JNZ r3, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r8, 0x2100
LDI r9, 0xFFFF00
LDI r13, 0x101820
DRAWTEXT r1, r12, r8, r9, r13

; ── Send PING command ──
LDI r3, 3
LDI r20, 0x0C03
STORE r20, r3         ; COMMAND = 3 (ping)
LDI r3, 1
LDI r20, 0x0C04
STORE r20, r3         ; STATUS = 1 (pending)

; Wait for response
LDI r0, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r3, ping_got
    SUBI r0, 1
    CMPI r0, 0
    JNZ r3, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r1, 10
LDI r12, 70
LDI r8, 0x2200
LDI r9, 0xFF4444
LDI r13, 0x101820
DRAWTEXT r1, r12, r8, r9, r13
JMP done

ping_got:
; Clear status
LDI r3, 0
LDI r20, 0x0C04
STORE r20, r3

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r1, 10
LDI r12, 70
CMPI r3, 0
JNZ r3, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r8, 0x2200
LDI r9, 0x44FF44
LDI r13, 0x101820
DRAWTEXT r1, r12, r8, r9, r13

; ── Now test REGS ──
LDI r3, 1
LDI r20, 0x0C03
STORE r20, r3
LDI r3, 1
LDI r20, 0x0C04
STORE r20, r3

LDI r0, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r3, regs_got
    SUBI r0, 1
    CMPI r0, 0
    JNZ r3, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r3, 0
LDI r20, 0x0C04
STORE r20, r3

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r1, 10
LDI r12, 90
LDI r8, 0x2300
LDI r9, 0x4488FF
LDI r13, 0x101820
DRAWTEXT r1, r12, r8, r9, r13

done:
FRAME
JMP done
