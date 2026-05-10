; DESCRIPTION: Composite: Places a cyan line segment connecting (273, 203) to (499, 112) then Creates a black circular shape at (398, 102) with radius 40.
; PLAN: r0=273(x1), r1=203(y1), r2=499(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=102(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 273
LDI r1, 203
LDI r2, 499
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 102
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
