; DESCRIPTION: Composite: Places a white circle of radius 31 at center (115, 159) then Draws a black line from (329, 85) to (341, 45).
; PLAN: r0=115(x), r1=159(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=85(y1), r7=341(x2), r8=45(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 159
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 85
LDI r7, 341
LDI r8, 45
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
