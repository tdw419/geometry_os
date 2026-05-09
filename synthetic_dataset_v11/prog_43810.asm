; DESCRIPTION: Renders a red line between points (121, 132) and (71, 149).
; PLAN: r0=121(x1), r1=132(y1), r2=71(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 132
LDI r2, 71
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
