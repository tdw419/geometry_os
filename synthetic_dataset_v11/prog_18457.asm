; DESCRIPTION: Composite: . Then Draws a blue line from (23, 29) to (169, 31). Then Sets a single orange pixel at (107, 90).
; PLAN: r0=23(x1), r1=29(y1), r2=169(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=107(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue line from (23, 29) to (169, 31).
; PLAN: r0=23(x1), r1=29(y1), r2=169(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 29
LDI r2, 169
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (107, 90).
; PLAN: r0=107(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 90
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
