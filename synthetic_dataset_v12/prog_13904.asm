; DESCRIPTION: Places a magenta line segment connecting (294, 238) to (134, 123).
; PLAN: r0=294(x1), r1=238(y1), r2=134(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 238
LDI r2, 134
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
