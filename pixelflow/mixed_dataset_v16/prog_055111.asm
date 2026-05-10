; DESCRIPTION: Renders a blue line between points (187, 95) and (44, 194).
; PLAN: r0=187(x1), r1=95(y1), r2=44(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 95
LDI r2, 44
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
