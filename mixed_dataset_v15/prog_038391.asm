; DESCRIPTION: Composite: Sets a single yellow pixel at (357, 100) then Places a blue line segment connecting (368, 188) to (216, 14).
; PLAN: r0=357(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=368(x1), r6=188(y1), r7=216(x2), r8=14(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 368
LDI r6, 188
LDI r7, 216
LDI r8, 14
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
