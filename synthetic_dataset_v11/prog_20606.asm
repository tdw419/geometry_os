; DESCRIPTION: Draws a blue rectangle at (192, 67) with width 56 and height 20.
; PLAN: r0=192(x), r1=67(y), r2=56(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 67
LDI r2, 56
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
