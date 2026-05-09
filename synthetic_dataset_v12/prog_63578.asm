; DESCRIPTION: Places a magenta line segment connecting (214, 119) to (367, 159).
; PLAN: r0=214(x1), r1=119(y1), r2=367(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 119
LDI r2, 367
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
