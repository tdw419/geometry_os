; DESCRIPTION: Places a cyan 113x58 rectangle at position (196, 74).
; PLAN: r0=196(x), r1=74(y), r2=113(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 74
LDI r2, 113
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
