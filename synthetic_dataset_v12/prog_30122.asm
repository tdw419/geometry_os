; DESCRIPTION: Places a magenta line segment connecting (184, 226) to (73, 23).
; PLAN: r0=184(x1), r1=226(y1), r2=73(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 226
LDI r2, 73
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
