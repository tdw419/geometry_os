; DESCRIPTION: Places a red line segment connecting (496, 177) to (63, 216).
; PLAN: r0=496(x1), r1=177(y1), r2=63(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 177
LDI r2, 63
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
