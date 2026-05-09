; DESCRIPTION: Places a black line segment connecting (275, 236) to (36, 82).
; PLAN: r0=275(x1), r1=236(y1), r2=36(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 236
LDI r2, 36
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
