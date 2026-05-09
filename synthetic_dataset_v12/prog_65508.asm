; DESCRIPTION: Composite: Places a white line segment connecting (81, 155) to (342, 117) then Sets a single yellow pixel at (499, 90) then Renders a white disk with center (380, 61) and radius 50.
; PLAN: r0=81(x1), r1=155(y1), r2=342(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=90(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=380(x), r11=61(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 155
LDI r2, 342
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 90
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 380
LDI r11, 61
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
