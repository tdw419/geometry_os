; DESCRIPTION: Composite: Renders a magenta line between points (100, 79) and (58, 101) then Draws a green rectangle at (17, 49) with width 87 and height 42.
; PLAN: r0=100(x1), r1=79(y1), r2=58(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=49(y), r7=87(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 79
LDI r2, 58
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 49
LDI r7, 87
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
