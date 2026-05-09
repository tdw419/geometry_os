; DESCRIPTION: Composite: Places a red line segment connecting (169, 29) to (429, 197) then Places a orange circle of radius 35 at center (283, 153) then Sets a single yellow pixel at (187, 236).
; PLAN: r0=169(x1), r1=29(y1), r2=429(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=153(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=236(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 29
LDI r2, 429
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 153
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 236
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
