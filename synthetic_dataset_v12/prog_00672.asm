; DESCRIPTION: Composite: Creates a black circular shape at (146, 103) with radius 77 then Renders a blue line between points (147, 188) and (324, 124) then Sets a single black pixel at (154, 234).
; PLAN: r0=146(x), r1=103(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x1), r6=188(y1), r7=324(x2), r8=124(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=234(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 103
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 188
LDI r7, 324
LDI r8, 124
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 234
LDI r12, 0x000000
PSET r10, r11, r12
HALT
