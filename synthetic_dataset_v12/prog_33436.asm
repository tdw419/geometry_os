; DESCRIPTION: Places a black line segment connecting (123, 236) to (273, 194).
; PLAN: r0=123(x1), r1=236(y1), r2=273(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 236
LDI r2, 273
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
