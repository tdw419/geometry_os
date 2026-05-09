; DESCRIPTION: Places a magenta line segment connecting (41, 150) to (254, 10).
; PLAN: r0=41(x1), r1=150(y1), r2=254(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 150
LDI r2, 254
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
