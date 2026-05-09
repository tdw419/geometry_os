; DESCRIPTION: Renders a black line between points (124, 109) and (400, 194).
; PLAN: r0=124(x1), r1=109(y1), r2=400(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 109
LDI r2, 400
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
