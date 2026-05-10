; DESCRIPTION: Draws a purple rectangle at (378, 146) with width 91 and height 111.
; PLAN: r0=378(x), r1=146(y), r2=91(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 146
LDI r2, 91
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
