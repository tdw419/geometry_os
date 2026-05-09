; DESCRIPTION: Places a magenta line segment connecting (432, 133) to (285, 177).
; PLAN: r0=432(x1), r1=133(y1), r2=285(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 133
LDI r2, 285
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
