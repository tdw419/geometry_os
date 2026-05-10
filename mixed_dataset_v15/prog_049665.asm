; DESCRIPTION: Places a magenta line segment connecting (61, 97) to (131, 226).
; PLAN: r0=61(x1), r1=97(y1), r2=131(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 97
LDI r2, 131
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
