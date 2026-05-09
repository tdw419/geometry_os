; DESCRIPTION: Renders a black line between points (146, 7) and (143, 124).
; PLAN: r0=146(x1), r1=7(y1), r2=143(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 7
LDI r2, 143
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
