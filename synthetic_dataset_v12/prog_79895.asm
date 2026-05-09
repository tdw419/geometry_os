; DESCRIPTION: Draws a black rectangle at (378, 195) with width 94 and height 53.
; PLAN: r0=378(x), r1=195(y), r2=94(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 195
LDI r2, 94
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
