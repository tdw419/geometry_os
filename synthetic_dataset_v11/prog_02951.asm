; DESCRIPTION: Places a blue 84x118 rectangle at position (97, 92).
; PLAN: r0=97(x), r1=92(y), r2=84(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 92
LDI r2, 84
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
