; DESCRIPTION: Renders a black line between points (289, 236) and (356, 245).
; PLAN: r0=289(x1), r1=236(y1), r2=356(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 236
LDI r2, 356
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
