; DESCRIPTION: Draws a red object at the screen with fixed size.

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

LDI r11, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r10, 0x2A0A0A
FILL r10

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r11, 10
LDI r13, 10
LDI r12, 0x1000
LDI r6, 0xFF0000
LDI r0, 0x2A0A0A
DRAWTEXT r11, r13, r12, r6, r0

; Initialize debug mailbox
LDI r10, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r10

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r10

LDI r10, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r10

; Counter: update heartbeat 5 times then crash
LDI r0, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r10, r20
    ADDI r10, 1
    STORE r20, r10

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r10, beat_loop
    STORE r20, r10

    ; Decrement counter
    SUBI r0, 1
    CMPI r0, 0
    JZ r10, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r10, 0xFF0000
    LDI r11, 50
    LDI r13, 50
    LDI r12, 50
    LDI r6, 50
    RECTF r11, r13, r12, r6, r10

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
