; DESCRIPTION: Composite: Renders a black disk with center (152, 99) and radius 24 then Places a white 80x14 rectangle at position (335, 201) then Places a magenta line segment connecting (37, 2) to (4, 137).
; PLAN: r0=152(x), r1=99(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=201(y), r7=80(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=37(x1), r11=2(y1), r12=4(x2), r13=137(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 99
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 201
LDI r7, 80
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 2
LDI r12, 4
LDI r13, 137
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
