; DESCRIPTION: Draws a purple rectangle at (177, 2) with width 111 and height 85.
; PLAN: r0=177(x), r1=2(y), r2=111(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 2
LDI r2, 111
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
