; DESCRIPTION: Places a magenta line segment connecting (14, 226) to (19, 131).
; PLAN: r0=14(x1), r1=226(y1), r2=19(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 226
LDI r2, 19
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
