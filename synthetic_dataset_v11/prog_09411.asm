; DESCRIPTION: Places a green line segment connecting (208, 253) to (5, 78).
; PLAN: r0=208(x1), r1=253(y1), r2=5(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 253
LDI r2, 5
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
