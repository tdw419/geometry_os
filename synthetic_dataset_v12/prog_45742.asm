; DESCRIPTION: Draws a purple rectangle at (27, 169) with width 20 and height 32.
; PLAN: r0=27(x), r1=169(y), r2=20(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 169
LDI r2, 20
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
