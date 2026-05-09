; DESCRIPTION: Places a magenta line segment connecting (221, 177) to (172, 56).
; PLAN: r0=221(x1), r1=177(y1), r2=172(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 177
LDI r2, 172
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
