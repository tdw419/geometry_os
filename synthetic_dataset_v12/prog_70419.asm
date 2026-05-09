; DESCRIPTION: Composite: Places a yellow line segment connecting (229, 118) to (445, 179) then Sets a single cyan pixel at (455, 161).
; PLAN: r0=229(x1), r1=118(y1), r2=445(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=161(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 118
LDI r2, 445
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 161
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
