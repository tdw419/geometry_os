; DESCRIPTION: Places a yellow line segment connecting (399, 177) to (60, 123).
; PLAN: r0=399(x1), r1=177(y1), r2=60(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 177
LDI r2, 60
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
