; DESCRIPTION: Places a magenta line segment connecting (108, 98) to (188, 233).
; PLAN: r0=108(x1), r1=98(y1), r2=188(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 98
LDI r2, 188
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
