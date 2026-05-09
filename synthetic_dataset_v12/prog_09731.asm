; DESCRIPTION: Places a magenta line segment connecting (84, 47) to (208, 197).
; PLAN: r0=84(x1), r1=47(y1), r2=208(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 47
LDI r2, 208
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
