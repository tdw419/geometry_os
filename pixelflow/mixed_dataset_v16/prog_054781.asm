; DESCRIPTION: Composite: Places a cyan circle of radius 23 at center (433, 161) then Places a magenta line segment connecting (89, 185) to (323, 232) then Creates a green rectangular region at (257, 144) spanning 30 by 65 pixels.
; PLAN: r0=433(x), r1=161(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x1), r6=185(y1), r7=323(x2), r8=232(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=257(x), r11=144(y), r12=30(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 161
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 185
LDI r7, 323
LDI r8, 232
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 144
LDI r12, 30
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
