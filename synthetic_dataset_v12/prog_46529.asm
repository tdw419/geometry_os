; DESCRIPTION: Renders a black line between points (121, 159) and (377, 161).
; PLAN: r0=121(x1), r1=159(y1), r2=377(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 159
LDI r2, 377
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
