; DESCRIPTION: Places a orange line segment connecting (45, 95) to (178, 240).
; PLAN: r0=45(x1), r1=95(y1), r2=178(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 95
LDI r2, 178
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
