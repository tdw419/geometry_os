; DESCRIPTION: Renders a black line between points (204, 124) and (180, 13).
; PLAN: r0=204(x1), r1=124(y1), r2=180(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 124
LDI r2, 180
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
