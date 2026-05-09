; DESCRIPTION: Places a black line segment connecting (181, 79) to (45, 93).
; PLAN: r0=181(x1), r1=79(y1), r2=45(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 79
LDI r2, 45
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
