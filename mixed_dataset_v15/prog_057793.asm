; DESCRIPTION: Composite: Renders a white disk with center (334, 159) and radius 63 then Places a black line segment connecting (65, 98) to (248, 203).
; PLAN: r0=334(x), r1=159(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x1), r6=98(y1), r7=248(x2), r8=203(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 159
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 98
LDI r7, 248
LDI r8, 203
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
