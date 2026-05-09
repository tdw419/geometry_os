; DESCRIPTION: Composite: Renders a blue box of size 117x88 starting at (13, 147) then Renders a green line between points (468, 8) and (216, 114) then Sets a single magenta pixel at (188, 192).
; PLAN: r0=13(x), r1=147(y), r2=117(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x1), r6=8(y1), r7=216(x2), r8=114(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=192(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 13
LDI r1, 147
LDI r2, 117
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 8
LDI r7, 216
LDI r8, 114
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 192
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
