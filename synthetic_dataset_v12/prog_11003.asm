; DESCRIPTION: Renders a white line between points (142, 127) and (472, 93).
; PLAN: r0=142(x1), r1=127(y1), r2=472(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 127
LDI r2, 472
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
