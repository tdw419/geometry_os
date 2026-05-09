; DESCRIPTION: Draws a purple rectangle at (172, 146) with width 63 and height 101.
; PLAN: r0=172(x), r1=146(y), r2=63(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 146
LDI r2, 63
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
