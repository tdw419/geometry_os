; DESCRIPTION: Renders a black line between points (41, 45) and (454, 59).
; PLAN: r0=41(x1), r1=45(y1), r2=454(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 45
LDI r2, 454
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
