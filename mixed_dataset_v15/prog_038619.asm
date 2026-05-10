; DESCRIPTION: Composite: Places a blue circle of radius 41 at center (88, 189) then Draws a white line from (37, 128) to (440, 92) then Sets a single black pixel at (487, 247).
; PLAN: r0=88(x), r1=189(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x1), r6=128(y1), r7=440(x2), r8=92(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=487(x), r11=247(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 189
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 128
LDI r7, 440
LDI r8, 92
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 247
LDI r12, 0x000000
PSET r10, r11, r12
HALT
