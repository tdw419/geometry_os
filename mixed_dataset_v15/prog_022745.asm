; DESCRIPTION: Places a magenta line segment connecting (382, 180) to (245, 123).
; PLAN: r0=382(x1), r1=180(y1), r2=245(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 180
LDI r2, 245
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
