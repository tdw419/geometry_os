; DESCRIPTION: Places a red line segment connecting (219, 87) to (45, 172).
; PLAN: r0=219(x1), r1=87(y1), r2=45(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 87
LDI r2, 45
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
