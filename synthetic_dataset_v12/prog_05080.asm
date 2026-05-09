; DESCRIPTION: Places a magenta line segment connecting (226, 211) to (266, 180).
; PLAN: r0=226(x1), r1=211(y1), r2=266(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 211
LDI r2, 266
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
