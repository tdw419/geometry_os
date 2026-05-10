; DESCRIPTION: Draws a blue rectangle at (177, 110) with width 93 and height 111.
; PLAN: r0=177(x), r1=110(y), r2=93(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 110
LDI r2, 93
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
