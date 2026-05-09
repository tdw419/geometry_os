; DESCRIPTION: Places a magenta line segment connecting (194, 25) to (200, 223).
; PLAN: r0=194(x1), r1=25(y1), r2=200(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 25
LDI r2, 200
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
