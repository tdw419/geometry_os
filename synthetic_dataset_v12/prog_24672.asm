; DESCRIPTION: Places a green line segment connecting (68, 25) to (343, 204).
; PLAN: r0=68(x1), r1=25(y1), r2=343(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 25
LDI r2, 343
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
