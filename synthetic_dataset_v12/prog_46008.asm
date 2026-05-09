; DESCRIPTION: Draws a purple rectangle at (168, 147) with width 109 and height 35.
; PLAN: r0=168(x), r1=147(y), r2=109(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 147
LDI r2, 109
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
