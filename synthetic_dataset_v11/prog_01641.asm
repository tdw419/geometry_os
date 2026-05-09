; DESCRIPTION: Renders a black line between points (125, 137) and (180, 38).
; PLAN: r0=125(x1), r1=137(y1), r2=180(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 137
LDI r2, 180
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
