; DESCRIPTION: Composite: Places a yellow line segment connecting (229, 161) to (127, 186) then Sets a single orange pixel at (345, 67).
; PLAN: r0=229(x1), r1=161(y1), r2=127(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=67(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 161
LDI r2, 127
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 67
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
