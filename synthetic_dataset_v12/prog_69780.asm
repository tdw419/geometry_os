; DESCRIPTION: Renders a black line between points (511, 191) and (313, 244).
; PLAN: r0=511(x1), r1=191(y1), r2=313(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 191
LDI r2, 313
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
