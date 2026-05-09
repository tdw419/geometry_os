; DESCRIPTION: Draws a blue rectangle at (48, 17) with width 106 and height 96.
; PLAN: r0=48(x), r1=17(y), r2=106(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 17
LDI r2, 106
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
