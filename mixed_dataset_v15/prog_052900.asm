; DESCRIPTION: Renders a black line between points (476, 172) and (193, 194).
; PLAN: r0=476(x1), r1=172(y1), r2=193(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 172
LDI r2, 193
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
