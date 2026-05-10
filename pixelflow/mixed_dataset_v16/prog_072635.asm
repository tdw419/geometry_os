; DESCRIPTION: Composite: Renders a orange disk with center (87, 185) and radius 39 then Places a red line segment connecting (361, 74) to (89, 225).
; PLAN: r0=87(x), r1=185(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x1), r6=74(y1), r7=89(x2), r8=225(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 185
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 74
LDI r7, 89
LDI r8, 225
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
