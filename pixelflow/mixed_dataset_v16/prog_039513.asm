; DESCRIPTION: Places a magenta line segment connecting (182, 153) to (496, 17).
; PLAN: r0=182(x1), r1=153(y1), r2=496(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 153
LDI r2, 496
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
