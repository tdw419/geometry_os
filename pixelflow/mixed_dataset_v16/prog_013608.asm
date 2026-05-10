; DESCRIPTION: Places a magenta line segment connecting (34, 52) to (446, 203).
; PLAN: r0=34(x1), r1=52(y1), r2=446(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 52
LDI r2, 446
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
