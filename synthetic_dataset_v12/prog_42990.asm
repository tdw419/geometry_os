; DESCRIPTION: Composite: Places a yellow line segment connecting (301, 189) to (338, 219) then Creates a cyan circular shape at (133, 110) with radius 43.
; PLAN: r0=301(x1), r1=189(y1), r2=338(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=110(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 189
LDI r2, 338
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 110
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
