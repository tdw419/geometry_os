; DESCRIPTION: Composite: Draws a cyan line from (269, 89) to (399, 153) then Sets a single orange pixel at (222, 125).
; PLAN: r0=269(x1), r1=89(y1), r2=399(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=125(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 269
LDI r1, 89
LDI r2, 399
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 125
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
