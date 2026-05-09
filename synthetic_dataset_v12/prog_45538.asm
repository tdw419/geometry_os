; DESCRIPTION: Places a black line segment connecting (102, 193) to (45, 21).
; PLAN: r0=102(x1), r1=193(y1), r2=45(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 193
LDI r2, 45
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
