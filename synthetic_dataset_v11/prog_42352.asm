; DESCRIPTION: Composite: . Then Draws a black rectangle at (179, 88) with width 42 and height 73. Then Renders a magenta line between points (58, 144) and (55, 147).
; PLAN: r0=179(x), r1=88(y), r2=42(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=58(x1), r1=144(y1), r2=55(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (179, 88) with width 42 and height 73.
; PLAN: r0=179(x), r1=88(y), r2=42(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 88
LDI r2, 42
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (58, 144) and (55, 147).
; PLAN: r0=58(x1), r1=144(y1), r2=55(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 144
LDI r2, 55
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
