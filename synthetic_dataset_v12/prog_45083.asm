; DESCRIPTION: Draws a blue rectangle at (27, 95) with width 78 and height 77.
; PLAN: r0=27(x), r1=95(y), r2=78(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 95
LDI r2, 78
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
