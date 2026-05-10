; DESCRIPTION: Composite: Places a purple line segment connecting (305, 32) to (461, 68) then Sets a single orange pixel at (137, 117).
; PLAN: r0=305(x1), r1=32(y1), r2=461(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=117(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 32
LDI r2, 461
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 117
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
