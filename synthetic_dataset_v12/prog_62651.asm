; DESCRIPTION: Composite: Places a black line segment connecting (143, 224) to (95, 25) then Renders a orange disk with center (444, 97) and radius 68.
; PLAN: r0=143(x1), r1=224(y1), r2=95(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=97(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 224
LDI r2, 95
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 97
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
