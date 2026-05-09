; DESCRIPTION: Places a white line segment connecting (214, 79) to (193, 147).
; PLAN: r0=214(x1), r1=79(y1), r2=193(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 79
LDI r2, 193
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
