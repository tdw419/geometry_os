; DESCRIPTION: Renders a black line between points (149, 107) and (238, 127).
; PLAN: r0=149(x1), r1=107(y1), r2=238(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 107
LDI r2, 238
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
