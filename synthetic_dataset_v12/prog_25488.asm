; DESCRIPTION: Renders a black line between points (243, 51) and (130, 11).
; PLAN: r0=243(x1), r1=51(y1), r2=130(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 51
LDI r2, 130
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
