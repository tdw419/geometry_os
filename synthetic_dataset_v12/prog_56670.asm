; DESCRIPTION: Places a yellow line segment connecting (247, 233) to (145, 229).
; PLAN: r0=247(x1), r1=233(y1), r2=145(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 233
LDI r2, 145
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
