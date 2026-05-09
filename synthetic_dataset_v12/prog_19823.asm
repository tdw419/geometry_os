; DESCRIPTION: Draws a blue rectangle at (48, 54) with width 112 and height 74.
; PLAN: r0=48(x), r1=54(y), r2=112(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 54
LDI r2, 112
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
