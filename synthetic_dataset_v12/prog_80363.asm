; DESCRIPTION: Places a black line segment connecting (504, 143) to (147, 48).
; PLAN: r0=504(x1), r1=143(y1), r2=147(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 143
LDI r2, 147
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
