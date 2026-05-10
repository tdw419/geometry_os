; DESCRIPTION: Places a orange line segment connecting (370, 45) to (412, 10).
; PLAN: r0=370(x1), r1=45(y1), r2=412(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 45
LDI r2, 412
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
