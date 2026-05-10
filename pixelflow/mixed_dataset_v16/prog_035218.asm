; DESCRIPTION: Composite: Draws a green line from (486, 249) to (461, 115) then Sets a single yellow pixel at (187, 68).
; PLAN: r0=486(x1), r1=249(y1), r2=461(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=68(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 486
LDI r1, 249
LDI r2, 461
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 68
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
