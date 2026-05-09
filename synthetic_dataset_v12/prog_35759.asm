; DESCRIPTION: Places a magenta line segment connecting (511, 137) to (124, 132).
; PLAN: r0=511(x1), r1=137(y1), r2=124(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 137
LDI r2, 124
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
