; DESCRIPTION: Composite: Draws a yellow circle centered at (292, 169) with radius 73 then Places a orange line segment connecting (429, 228) to (458, 122) then Sets a single blue pixel at (503, 7).
; PLAN: r0=292(x), r1=169(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x1), r6=228(y1), r7=458(x2), r8=122(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=7(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 169
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 228
LDI r7, 458
LDI r8, 122
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 7
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
