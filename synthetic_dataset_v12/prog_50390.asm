; DESCRIPTION: Places a magenta line segment connecting (76, 53) to (146, 34).
; PLAN: r0=76(x1), r1=53(y1), r2=146(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 53
LDI r2, 146
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
