; DESCRIPTION: Renders a black line between points (452, 191) and (13, 172).
; PLAN: r0=452(x1), r1=191(y1), r2=13(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 191
LDI r2, 13
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
