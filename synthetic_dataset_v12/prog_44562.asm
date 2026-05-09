; DESCRIPTION: Composite: Creates a yellow circular shape at (220, 105) with radius 70 then Renders a magenta line between points (289, 187) and (34, 118) then Sets a single black pixel at (145, 93).
; PLAN: r0=220(x), r1=105(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x1), r6=187(y1), r7=34(x2), r8=118(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=93(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 105
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 187
LDI r7, 34
LDI r8, 118
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 93
LDI r12, 0x000000
PSET r10, r11, r12
HALT
