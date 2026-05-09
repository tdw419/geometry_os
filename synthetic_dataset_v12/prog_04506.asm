; DESCRIPTION: Places a magenta line segment connecting (456, 53) to (471, 84).
; PLAN: r0=456(x1), r1=53(y1), r2=471(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 53
LDI r2, 471
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
