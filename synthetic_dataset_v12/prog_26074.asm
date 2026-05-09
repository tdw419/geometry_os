; DESCRIPTION: Places a black line segment connecting (462, 79) to (400, 133).
; PLAN: r0=462(x1), r1=79(y1), r2=400(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 79
LDI r2, 400
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
