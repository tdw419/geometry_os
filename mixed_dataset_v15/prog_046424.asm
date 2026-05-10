; DESCRIPTION: Places a black line segment connecting (77, 104) to (325, 146).
; PLAN: r0=77(x1), r1=104(y1), r2=325(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 104
LDI r2, 325
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
