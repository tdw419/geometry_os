; DESCRIPTION: Composite: Places a red line segment connecting (495, 79) to (42, 234) then Creates a blue circular shape at (166, 169) with radius 68.
; PLAN: r0=495(x1), r1=79(y1), r2=42(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=169(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 495
LDI r1, 79
LDI r2, 42
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 169
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
