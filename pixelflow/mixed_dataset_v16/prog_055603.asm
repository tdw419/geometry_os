; DESCRIPTION: Composite: Renders a green box of size 95x54 starting at (232, 4) then Renders a magenta line between points (325, 159) and (396, 58).
; PLAN: r0=232(x), r1=4(y), r2=95(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x1), r6=159(y1), r7=396(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 4
LDI r2, 95
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 159
LDI r7, 396
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
