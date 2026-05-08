; DESCRIPTION: Geometry OS program to draw a red object.

; flatliner.asm -- Test program that simulates a crash
;
; Updates heartbeat 5 times, then stops.
; Used to test the watchdog/recovery system.
;
; Page 3 Debug Mailbox:
;   0x0C00: DEBUG_MAGIC (0xDB9900)
;   0x0C02: DEBUG_CHILD_PID
;   0x0C27: DEBUG_HEARTBEAT
;   0x0C28: DEBUG_CHECKPOINT

#define DEBUG_MAGIC      0x0C00
#define DEBUG_CHILD_PID  0x0C02
#define DEBUG_HEARTBEAT  0x0C27
#define DEBUG_CHECKPOINT 0x0C28

LDI r9, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r12, 0x2A0A0A
FILL r12

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r9, 10
LDI r11, 10
LDI r4, 0x1000
LDI r1, 0xFF0000
LDI r7, 0x2A0A0A
DRAWTEXT r9, r11, r4, r1, r7

; Initialize debug mailbox
LDI r12, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r12

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r12

LDI r12, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r12

; Counter: update heartbeat 5 times then crash
LDI r7, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r12, r20
    ADDI r12, 1
    STORE r20, r12

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r12, beat_loop
    STORE r20, r12

    ; Decrement counter
    SUBI r7, 1
    CMPI r7, 0
    JZ r12, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r12, 0xFF0000
    LDI r9, 50
    LDI r11, 50
    LDI r4, 50
    LDI r1, 50
    RECTF r9, r11, r4, r1, r12

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
