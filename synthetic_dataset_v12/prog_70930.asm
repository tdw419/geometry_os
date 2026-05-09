; DESCRIPTION: Composite: Renders a cyan disk with center (166, 160) and radius 63 then Places a cyan line segment connecting (194, 29) to (417, 203).
; PLAN: r0=166(x), r1=160(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x1), r6=29(y1), r7=417(x2), r8=203(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 160
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 29
LDI r7, 417
LDI r8, 203
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
