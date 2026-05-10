; DESCRIPTION: Places a black line segment connecting (315, 193) to (349, 204).
; PLAN: r0=315(x1), r1=193(y1), r2=349(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 193
LDI r2, 349
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
