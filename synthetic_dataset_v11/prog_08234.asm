; DESCRIPTION: Places a magenta line segment connecting (65, 131) to (204, 207).
; PLAN: r0=65(x1), r1=131(y1), r2=204(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 131
LDI r2, 204
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
