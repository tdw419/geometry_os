; DESCRIPTION: Renders a black line between points (106, 82) and (74, 161).
; PLAN: r0=106(x1), r1=82(y1), r2=74(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 82
LDI r2, 74
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
