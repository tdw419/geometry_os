; DESCRIPTION: Places a green line segment connecting (11, 208) to (140, 124).
; PLAN: r0=11(x1), r1=208(y1), r2=140(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 208
LDI r2, 140
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
