; DESCRIPTION: Composite: Renders a orange disk with center (244, 179) and radius 15 then Renders a white line between points (469, 26) and (38, 104).
; PLAN: r0=244(x), r1=179(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x1), r6=26(y1), r7=38(x2), r8=104(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 179
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 26
LDI r7, 38
LDI r8, 104
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
