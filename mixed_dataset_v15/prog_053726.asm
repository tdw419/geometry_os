; DESCRIPTION: Composite: Places a cyan line segment connecting (250, 77) to (78, 105) then Creates a yellow circular shape at (121, 218) with radius 33.
; PLAN: r0=250(x1), r1=77(y1), r2=78(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=218(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 77
LDI r2, 78
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 218
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
