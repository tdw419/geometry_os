; DESCRIPTION: Renders a black line between points (197, 227) and (356, 96).
; PLAN: r0=197(x1), r1=227(y1), r2=356(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 227
LDI r2, 356
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
