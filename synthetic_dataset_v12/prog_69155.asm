; DESCRIPTION: Draws a purple rectangle at (241, 226) with width 114 and height 27.
; PLAN: r0=241(x), r1=226(y), r2=114(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 226
LDI r2, 114
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
