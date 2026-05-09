; DESCRIPTION: Places a blue 88x97 rectangle at position (137, 122).
; PLAN: r0=137(x), r1=122(y), r2=88(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 122
LDI r2, 88
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
