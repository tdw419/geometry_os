; DESCRIPTION: Renders a black line between points (411, 191) and (358, 218).
; PLAN: r0=411(x1), r1=191(y1), r2=358(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 191
LDI r2, 358
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
