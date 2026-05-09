; DESCRIPTION: Draws a blue rectangle at (60, 130) with width 79 and height 80.
; PLAN: r0=60(x), r1=130(y), r2=79(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 130
LDI r2, 79
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
