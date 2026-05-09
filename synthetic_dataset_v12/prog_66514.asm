; DESCRIPTION: Composite: Places a orange line segment connecting (265, 139) to (244, 171) then Sets a single black pixel at (34, 124) then Places a cyan circle of radius 32 at center (312, 137).
; PLAN: r0=265(x1), r1=139(y1), r2=244(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=34(x), r6=124(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=312(x), r11=137(y), r12=32(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 139
LDI r2, 244
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 124
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 312
LDI r11, 137
LDI r12, 32
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
