; DESCRIPTION: Composite: Places a green line segment connecting (296, 119) to (87, 68) then Creates a green circular shape at (364, 241) with radius 10.
; PLAN: r0=296(x1), r1=119(y1), r2=87(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=241(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 119
LDI r2, 87
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 241
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
