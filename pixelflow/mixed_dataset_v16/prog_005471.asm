; DESCRIPTION: Draws a purple rectangle at (21, 169) with width 27 and height 81.
; PLAN: r0=21(x), r1=169(y), r2=27(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 169
LDI r2, 27
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
