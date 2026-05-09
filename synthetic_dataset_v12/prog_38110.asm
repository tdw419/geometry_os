; DESCRIPTION: Places a blue 19x29 rectangle at position (196, 77).
; PLAN: r0=196(x), r1=77(y), r2=19(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 77
LDI r2, 19
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
