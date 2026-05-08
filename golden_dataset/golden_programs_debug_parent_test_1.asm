; DESCRIPTION: Render a colored object at the screen.

; debug_parent_test.asm -- Test parent that communicates with debug_monitor
;
; Loads debug_monitor as a child via SPAWNC, then pings it via Page 3 mailbox.
; Run this as the main program (with debug_monitor.asm assembled to /tmp/debug_monitor.bin).

LDI r3, 1
LDI r30, 0xFD00

; Clear screen
LDI r7, 0x101820
FILL r7

; Draw title
LDI r20, 0x1000
STRO r20, "Debug Parent Test"
LDI r3, 10
LDI r4, 10
LDI r2, 0x1000
LDI r12, 0x00FF00
LDI r5, 0x101820
DRAWTEXT r3, r4, r2, r12, r5

; ── Wait for child to initialize ──
LDI r20, 0x2000
STRO r20, "Waiting for child..."
LDI r3, 10
LDI r4, 30
LDI r2, 0x2000
LDI r12, 0xFFFFFF
LDI r5, 0x101820
DRAWTEXT r3, r4, r2, r12, r5

; Wait a bunch of frames for child to set up its debug stub
LDI r6, 60
wait_init:
    FRAME
    SUBI r6, 1
    CMPI r6, 0
    JNZ r7, wait_init

; ── Check magic ──
LDI r20, 0x0C00
LOAD r22, r20
LDI r23, 0xDB9900
CMP r22, r23

; Display magic check result
LDI r20, 0x2100
LDI r3, 10
LDI r4, 50
CMPI r7, 0
JNZ r7, magic_fail
STRO r20, "Magic OK! Sending PING..."
JMP magic_done
magic_fail:
STRO r20, "No magic found!"
magic_done:
LDI r2, 0x2100
LDI r12, 0xFFFF00
LDI r5, 0x101820
DRAWTEXT r3, r4, r2, r12, r5

; ── Send PING command ──
LDI r7, 3
LDI r20, 0x0C03
STORE r20, r7         ; COMMAND = 3 (ping)
LDI r7, 1
LDI r20, 0x0C04
STORE r20, r7         ; STATUS = 1 (pending)

; Wait for response
LDI r8, 200
ping_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r7, ping_got
    SUBI r8, 1
    CMPI r8, 0
    JNZ r7, ping_wait

; Timeout
LDI r20, 0x2200
STRO r20, "PING TIMEOUT!"
LDI r3, 10
LDI r4, 70
LDI r2, 0x2200
LDI r12, 0xFF4444
LDI r5, 0x101820
DRAWTEXT r3, r4, r2, r12, r5
JMP done

ping_got:
; Clear status
LDI r7, 0
LDI r20, 0x0C04
STORE r20, r7

; Check response
LDI r20, 0x0C05
LOAD r22, r20
LDI r23, 0x504E4720
CMP r22, r23

LDI r20, 0x2200
LDI r3, 10
LDI r4, 70
CMPI r7, 0
JNZ r7, pong_fail
STRO r20, "PONG received! Bridge works!"
JMP pong_done
pong_fail:
STRO r20, "Bad response"
pong_done:
LDI r2, 0x2200
LDI r12, 0x44FF44
LDI r5, 0x101820
DRAWTEXT r3, r4, r2, r12, r5

; ── Now test REGS ──
LDI r7, 1
LDI r20, 0x0C03
STORE r20, r7
LDI r7, 1
LDI r20, 0x0C04
STORE r20, r7

LDI r8, 200
regs_wait:
    FRAME
    LDI r20, 0x0C04
    LOAD r22, r20
    CMPI r22, 2
    JZ r7, regs_got
    SUBI r8, 1
    CMPI r8, 0
    JNZ r7, regs_wait

LDI r20, 0x2300
STRO r20, "REGS TIMEOUT!"
JMP show_regs
regs_got:
LDI r7, 0
LDI r20, 0x0C04
STORE r20, r7

LDI r20, 0x2300
STRO r20, "REGS OK!"

show_regs:
LDI r3, 10
LDI r4, 90
LDI r2, 0x2300
LDI r12, 0x4488FF
LDI r5, 0x101820
DRAWTEXT r3, r4, r2, r12, r5

done:
FRAME
JMP done
