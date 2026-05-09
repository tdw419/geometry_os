; DESCRIPTION: Places a magenta line segment connecting (62, 246) to (41, 33).
; PLAN: r0=62(x1), r1=246(y1), r2=41(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 246
LDI r2, 41
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
