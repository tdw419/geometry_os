; DESCRIPTION: Composite: Sets a single orange pixel at (81, 132) then Renders a orange line between points (373, 208) and (474, 254) then Creates a cyan circular shape at (134, 174) with radius 48.
; PLAN: r0=81(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=373(x1), r6=208(y1), r7=474(x2), r8=254(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=174(y), r12=48(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 132
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 373
LDI r6, 208
LDI r7, 474
LDI r8, 254
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 174
LDI r12, 48
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
