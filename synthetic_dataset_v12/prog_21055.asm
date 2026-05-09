; DESCRIPTION: Draws a purple rectangle at (209, 176) with width 17 and height 27.
; PLAN: r0=209(x), r1=176(y), r2=17(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 176
LDI r2, 17
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
