; DESCRIPTION: Composite: Creates a black circular shape at (55, 112) with radius 24 then Renders a red line between points (145, 46) and (79, 76).
; PLAN: r0=55(x), r1=112(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x1), r6=46(y1), r7=79(x2), r8=76(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 112
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 46
LDI r7, 79
LDI r8, 76
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
