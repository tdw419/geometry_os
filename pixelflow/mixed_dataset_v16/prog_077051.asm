; DESCRIPTION: Draws a blue rectangle at (158, 152) with width 20 and height 10.
; PLAN: r0=158(x), r1=152(y), r2=20(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 152
LDI r2, 20
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
