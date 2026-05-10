; DESCRIPTION: Places a orange line segment connecting (388, 212) to (488, 45).
; PLAN: r0=388(x1), r1=212(y1), r2=488(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 212
LDI r2, 488
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
