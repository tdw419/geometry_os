; DESCRIPTION: Places a magenta line segment connecting (245, 55) to (252, 129).
; PLAN: r0=245(x1), r1=55(y1), r2=252(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 55
LDI r2, 252
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
