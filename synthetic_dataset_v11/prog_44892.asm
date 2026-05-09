; DESCRIPTION: Renders a black line between points (161, 82) and (249, 55).
; PLAN: r0=161(x1), r1=82(y1), r2=249(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 82
LDI r2, 249
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
