; DESCRIPTION: Places a magenta line segment connecting (499, 52) to (252, 158).
; PLAN: r0=499(x1), r1=52(y1), r2=252(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 52
LDI r2, 252
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
