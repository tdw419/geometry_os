; DESCRIPTION: Places a magenta line segment connecting (76, 219) to (182, 247).
; PLAN: r0=76(x1), r1=219(y1), r2=182(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 219
LDI r2, 182
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
