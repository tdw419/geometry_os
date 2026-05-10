; DESCRIPTION: Composite: Places a magenta dot at position (321, 120) then Renders a blue line between points (358, 33) and (429, 222) then Creates a green circular shape at (273, 89) with radius 50.
; PLAN: r0=321(x), r1=120(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=33(y1), r7=429(x2), r8=222(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=89(y), r12=50(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 120
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 33
LDI r7, 429
LDI r8, 222
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 89
LDI r12, 50
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
