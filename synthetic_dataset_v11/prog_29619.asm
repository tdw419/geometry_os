; DESCRIPTION: Places a orange line segment connecting (206, 216) to (45, 240).
; PLAN: r0=206(x1), r1=216(y1), r2=45(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 216
LDI r2, 45
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
