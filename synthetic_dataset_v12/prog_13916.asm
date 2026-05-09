; DESCRIPTION: Places a magenta line segment connecting (509, 70) to (252, 26).
; PLAN: r0=509(x1), r1=70(y1), r2=252(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 70
LDI r2, 252
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
