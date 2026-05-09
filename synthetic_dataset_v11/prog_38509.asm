; DESCRIPTION: Places a magenta line segment connecting (24, 53) to (91, 55).
; PLAN: r0=24(x1), r1=53(y1), r2=91(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 53
LDI r2, 91
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
