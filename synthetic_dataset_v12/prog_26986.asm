; DESCRIPTION: Renders a black line between points (287, 7) and (1, 247).
; PLAN: r0=287(x1), r1=7(y1), r2=1(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 7
LDI r2, 1
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
