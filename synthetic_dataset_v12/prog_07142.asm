; DESCRIPTION: Draws a black rectangle at (391, 133) with width 19 and height 112.
; PLAN: r0=391(x), r1=133(y), r2=19(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 133
LDI r2, 19
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
