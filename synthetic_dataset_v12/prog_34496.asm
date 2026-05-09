; DESCRIPTION: Places a cyan line segment connecting (311, 92) to (335, 140).
; PLAN: r0=311(x1), r1=92(y1), r2=335(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 92
LDI r2, 335
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
