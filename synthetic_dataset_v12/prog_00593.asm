; DESCRIPTION: Draws a purple rectangle at (394, 132) with width 17 and height 102.
; PLAN: r0=394(x), r1=132(y), r2=17(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 132
LDI r2, 17
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
