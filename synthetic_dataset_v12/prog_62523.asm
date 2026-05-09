; DESCRIPTION: Renders a blue line between points (223, 178) and (140, 82).
; PLAN: r0=223(x1), r1=178(y1), r2=140(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 178
LDI r2, 140
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
