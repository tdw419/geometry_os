; DESCRIPTION: Renders a black line between points (53, 191) and (260, 107).
; PLAN: r0=53(x1), r1=191(y1), r2=260(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 191
LDI r2, 260
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
