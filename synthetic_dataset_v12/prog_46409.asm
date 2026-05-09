; DESCRIPTION: Places a black line segment connecting (283, 236) to (276, 185).
; PLAN: r0=283(x1), r1=236(y1), r2=276(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 236
LDI r2, 276
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
