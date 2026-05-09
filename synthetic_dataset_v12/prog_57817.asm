; DESCRIPTION: Composite: Renders a blue line between points (37, 241) and (411, 148) then Sets a single orange pixel at (295, 158).
; PLAN: r0=37(x1), r1=241(y1), r2=411(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=158(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 241
LDI r2, 411
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 158
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
