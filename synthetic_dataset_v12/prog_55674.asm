; DESCRIPTION: Places a blue 84x88 rectangle at position (136, 18).
; PLAN: r0=136(x), r1=18(y), r2=84(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 18
LDI r2, 84
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
