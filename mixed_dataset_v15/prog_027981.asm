; DESCRIPTION: Composite: Renders a orange disk with center (138, 90) and radius 80 then Draws a black line from (275, 65) to (405, 49).
; PLAN: r0=138(x), r1=90(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x1), r6=65(y1), r7=405(x2), r8=49(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 90
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 65
LDI r7, 405
LDI r8, 49
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
