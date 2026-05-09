; DESCRIPTION: Places a magenta line segment connecting (112, 206) to (221, 162).
; PLAN: r0=112(x1), r1=206(y1), r2=221(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 206
LDI r2, 221
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
