; DESCRIPTION: Renders a black line between points (90, 33) and (206, 112).
; PLAN: r0=90(x1), r1=33(y1), r2=206(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 33
LDI r2, 206
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
