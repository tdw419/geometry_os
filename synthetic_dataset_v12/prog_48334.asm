; DESCRIPTION: Composite: Places a black dot at position (57, 174) then Places a magenta line segment connecting (365, 190) to (361, 235) then Creates a green circular shape at (288, 211) with radius 38.
; PLAN: r0=57(x), r1=174(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=365(x1), r6=190(y1), r7=361(x2), r8=235(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=288(x), r11=211(y), r12=38(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 174
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 365
LDI r6, 190
LDI r7, 361
LDI r8, 235
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 211
LDI r12, 38
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
