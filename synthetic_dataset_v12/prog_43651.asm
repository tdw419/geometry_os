; DESCRIPTION: Composite: Places a black line segment connecting (407, 99) to (262, 56) then Creates a blue circular shape at (379, 196) with radius 46.
; PLAN: r0=407(x1), r1=99(y1), r2=262(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=196(y), r7=46(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 99
LDI r2, 262
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 196
LDI r7, 46
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
