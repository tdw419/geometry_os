; DESCRIPTION: Composite: Places a blue line segment connecting (223, 135) to (461, 134) then Creates a cyan circular shape at (229, 86) with radius 80 then Sets a single magenta pixel at (189, 41).
; PLAN: r0=223(x1), r1=135(y1), r2=461(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=86(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=189(x), r11=41(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 135
LDI r2, 461
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 86
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 189
LDI r11, 41
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
