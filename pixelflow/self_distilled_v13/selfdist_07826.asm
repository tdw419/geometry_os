; DESCRIPTION: Draws a blue rectangle at (152, 74) with width 24 and height 20.
; PLAN: r0=152(x), r1=74(y), r2=24(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 74
LDI r2, 24
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
