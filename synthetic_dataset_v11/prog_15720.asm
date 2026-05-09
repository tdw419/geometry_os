; DESCRIPTION: Places a magenta line segment connecting (179, 247) to (251, 223).
; PLAN: r0=179(x1), r1=247(y1), r2=251(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 247
LDI r2, 251
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
