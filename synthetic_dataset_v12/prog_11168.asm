; DESCRIPTION: Composite: Creates a blue circular shape at (289, 133) with radius 10 then Draws a magenta line from (296, 43) to (302, 247) then Sets a single white pixel at (331, 131).
; PLAN: r0=289(x), r1=133(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x1), r6=43(y1), r7=302(x2), r8=247(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=131(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 133
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 43
LDI r7, 302
LDI r8, 247
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 131
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
