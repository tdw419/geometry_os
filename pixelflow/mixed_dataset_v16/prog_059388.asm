; DESCRIPTION: Places a black line segment connecting (55, 133) to (308, 171).
; PLAN: r0=55(x1), r1=133(y1), r2=308(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 133
LDI r2, 308
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
