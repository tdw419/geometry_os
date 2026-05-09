; DESCRIPTION: Places a orange line segment connecting (28, 120) to (45, 169).
; PLAN: r0=28(x1), r1=120(y1), r2=45(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 120
LDI r2, 45
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
