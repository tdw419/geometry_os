; DESCRIPTION: Places a orange line segment connecting (422, 45) to (395, 126).
; PLAN: r0=422(x1), r1=45(y1), r2=395(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 45
LDI r2, 395
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
