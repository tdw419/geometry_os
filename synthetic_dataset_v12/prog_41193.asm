; DESCRIPTION: Places a orange line segment connecting (433, 250) to (401, 185).
; PLAN: r0=433(x1), r1=250(y1), r2=401(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 250
LDI r2, 401
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
