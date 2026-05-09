; DESCRIPTION: Places a black line segment connecting (217, 160) to (143, 163).
; PLAN: r0=217(x1), r1=160(y1), r2=143(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 160
LDI r2, 143
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
