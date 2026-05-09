; DESCRIPTION: Places a orange line segment connecting (368, 45) to (319, 133).
; PLAN: r0=368(x1), r1=45(y1), r2=319(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 45
LDI r2, 319
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
