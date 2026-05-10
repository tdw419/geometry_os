; DESCRIPTION: Composite: Places a blue line segment connecting (347, 33) to (291, 47) then Creates a green circular shape at (154, 84) with radius 64.
; PLAN: r0=347(x1), r1=33(y1), r2=291(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=84(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 347
LDI r1, 33
LDI r2, 291
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 84
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
