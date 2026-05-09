; DESCRIPTION: Places a magenta line segment connecting (25, 73) to (188, 141).
; PLAN: r0=25(x1), r1=73(y1), r2=188(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 73
LDI r2, 188
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
