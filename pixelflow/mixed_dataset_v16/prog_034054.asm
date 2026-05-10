; DESCRIPTION: Composite: Draws a cyan circle centered at (289, 106) with radius 68 then Renders a magenta line between points (147, 53) and (212, 49).
; PLAN: r0=289(x), r1=106(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x1), r6=53(y1), r7=212(x2), r8=49(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 106
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 53
LDI r7, 212
LDI r8, 49
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
