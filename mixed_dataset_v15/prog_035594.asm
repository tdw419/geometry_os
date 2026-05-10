; DESCRIPTION: Composite: Places a yellow line segment connecting (454, 179) to (490, 54) then Creates a green circular shape at (202, 152) with radius 26.
; PLAN: r0=454(x1), r1=179(y1), r2=490(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=152(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 179
LDI r2, 490
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 152
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
