; DESCRIPTION: Display a object using color red at the screen.

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

LDI r10, 1
LDI r30, 0xFD00

; Fill with dark red
LDI r0, 0x2A0A0A
FILL r0

; Draw "FLATLINER" label
LDI r20, 0x1000
STRO r20, "Flatliner"
LDI r10, 10
LDI r7, 10
LDI r6, 0x1000
LDI r4, 0xFF0000
LDI r11, 0x2A0A0A
DRAWTEXT r10, r7, r6, r4, r11

; Initialize debug mailbox
LDI r0, 0xDB9900
LDI r20, DEBUG_MAGIC
STORE r20, r0

GETPID
LDI r20, DEBUG_CHILD_PID
STORE r20, r0

LDI r0, 0
LDI r20, DEBUG_HEARTBEAT
STORE r20, r0

; Counter: update heartbeat 5 times then crash
LDI r11, 5

beat_loop:
    FRAME

    ; Update heartbeat
    LDI r20, DEBUG_HEARTBEAT
    LOAD r0, r20
    ADDI r0, 1
    STORE r20, r0

    ; Update checkpoint
    LDI r20, DEBUG_CHECKPOINT
    LDI r0, beat_loop
    STORE r20, r0

    ; Decrement counter
    SUBI r11, 1
    CMPI r11, 0
    JZ r0, crash_now
    JMP beat_loop

crash_now:
    ; Simulate a crash: just halt (no more FRAME, no more heartbeat updates)
    ; Draw a red X to show we're "dead"
    LDI r0, 0xFF0000
    LDI r10, 50
    LDI r7, 50
    LDI r6, 50
    LDI r4, 50
    RECTF r10, r7, r6, r4, r0

dead_loop:
    ; Infinite loop with no FRAME -- the heartbeat stops updating
    JMP dead_loop
