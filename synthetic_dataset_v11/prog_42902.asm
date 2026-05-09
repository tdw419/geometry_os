; DESCRIPTION: Places a magenta line segment connecting (193, 29) to (73, 74).
; PLAN: r0=193(x1), r1=29(y1), r2=73(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 29
LDI r2, 73
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
