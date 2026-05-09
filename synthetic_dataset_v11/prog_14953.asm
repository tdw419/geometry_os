; DESCRIPTION: Draws a blue rectangle at (21, 88) with width 50 and height 12.
; PLAN: r0=21(x), r1=88(y), r2=50(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 88
LDI r2, 50
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
