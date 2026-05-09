; DESCRIPTION: Composite: Places a orange line segment connecting (88, 239) to (185, 68) then Places a black circle of radius 63 at center (439, 189).
; PLAN: r0=88(x1), r1=239(y1), r2=185(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=189(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 88
LDI r1, 239
LDI r2, 185
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 189
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
