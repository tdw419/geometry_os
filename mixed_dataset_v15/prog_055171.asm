; DESCRIPTION: Composite: Renders a orange line between points (72, 211) and (444, 149) then Places a purple circle of radius 44 at center (282, 199).
; PLAN: r0=72(x1), r1=211(y1), r2=444(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=199(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 211
LDI r2, 444
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 199
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
