; DESCRIPTION: Composite: Draws a orange line from (321, 193) to (406, 4) then Sets a single green pixel at (189, 8).
; PLAN: r0=321(x1), r1=193(y1), r2=406(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=8(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 193
LDI r2, 406
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 8
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
