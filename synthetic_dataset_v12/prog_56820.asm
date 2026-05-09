; DESCRIPTION: Places a black line segment connecting (433, 173) to (62, 185).
; PLAN: r0=433(x1), r1=173(y1), r2=62(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 173
LDI r2, 62
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
