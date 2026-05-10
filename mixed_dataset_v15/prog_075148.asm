; DESCRIPTION: Draws a yellow rectangle at (341, 195) with width 90 and height 25.
; PLAN: r0=341(x), r1=195(y), r2=90(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 195
LDI r2, 90
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
