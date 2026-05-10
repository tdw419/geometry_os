; DESCRIPTION: Composite: Renders a green line between points (135, 207) and (130, 31) then Sets a single orange pixel at (463, 153).
; PLAN: r0=135(x1), r1=207(y1), r2=130(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=153(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 207
LDI r2, 130
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 153
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
