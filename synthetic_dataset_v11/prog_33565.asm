; DESCRIPTION: Places a orange line segment connecting (130, 67) to (145, 82).
; PLAN: r0=130(x1), r1=67(y1), r2=145(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 67
LDI r2, 145
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
