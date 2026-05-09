; DESCRIPTION: Composite: Places a blue line segment connecting (484, 241) to (173, 200) then Creates a purple circular shape at (439, 209) with radius 29.
; PLAN: r0=484(x1), r1=241(y1), r2=173(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=209(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 241
LDI r2, 173
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 209
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
