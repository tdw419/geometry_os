; DESCRIPTION: Draws a purple rectangle at (391, 10) with width 73 and height 102.
; PLAN: r0=391(x), r1=10(y), r2=73(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 10
LDI r2, 73
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
