; DESCRIPTION: Draws a orange line from (341, 170) to (398, 145).
; PLAN: r0=341(x1), r1=170(y1), r2=398(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 170
LDI r2, 398
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
