; DESCRIPTION: Composite: Draws a black rectangle at (84, 169) with width 115 and height 58 then Places a magenta line segment connecting (19, 42) to (63, 63).
; PLAN: r0=84(x), r1=169(y), r2=115(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x1), r6=42(y1), r7=63(x2), r8=63(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 169
LDI r2, 115
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 42
LDI r7, 63
LDI r8, 63
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
