; DESCRIPTION: Composite: Renders a orange disk with center (203, 38) and radius 26 then Places a yellow line segment connecting (431, 248) to (187, 10).
; PLAN: r0=203(x), r1=38(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=248(y1), r7=187(x2), r8=10(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 38
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 248
LDI r7, 187
LDI r8, 10
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
