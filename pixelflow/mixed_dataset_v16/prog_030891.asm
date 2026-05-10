; DESCRIPTION: Composite: Creates a purple circular shape at (381, 87) with radius 11 then Renders a blue line between points (408, 133) and (462, 153) then Sets a single black pixel at (61, 11).
; PLAN: r0=381(x), r1=87(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x1), r6=133(y1), r7=462(x2), r8=153(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=61(x), r11=11(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 87
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 133
LDI r7, 462
LDI r8, 153
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 11
LDI r12, 0x000000
PSET r10, r11, r12
HALT
