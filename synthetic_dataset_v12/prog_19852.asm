; DESCRIPTION: Draws a blue rectangle at (162, 7) with width 115 and height 111.
; PLAN: r0=162(x), r1=7(y), r2=115(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 7
LDI r2, 115
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
