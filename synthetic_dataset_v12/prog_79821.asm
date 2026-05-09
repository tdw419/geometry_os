; DESCRIPTION: Composite: Draws a cyan line from (229, 137) to (199, 100) then Creates a red circular shape at (426, 100) with radius 63 then Sets a single orange pixel at (263, 63).
; PLAN: r0=229(x1), r1=137(y1), r2=199(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=100(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=263(x), r11=63(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 137
LDI r2, 199
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 100
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 263
LDI r11, 63
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
