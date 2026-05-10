; DESCRIPTION: Composite: Places a black circle of radius 10 at center (88, 144) then Places a cyan line segment connecting (241, 87) to (476, 19).
; PLAN: r0=88(x), r1=144(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x1), r6=87(y1), r7=476(x2), r8=19(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 144
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 87
LDI r7, 476
LDI r8, 19
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
