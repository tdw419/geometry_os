; DESCRIPTION: Composite: Renders a yellow disk with center (205, 160) and radius 58 then Places a purple line segment connecting (303, 44) to (120, 16) then Places a black 58x20 rectangle at position (417, 201).
; PLAN: r0=205(x), r1=160(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x1), r6=44(y1), r7=120(x2), r8=16(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=417(x), r11=201(y), r12=58(width), r13=20(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 160
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 44
LDI r7, 120
LDI r8, 16
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 201
LDI r12, 58
LDI r13, 20
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
