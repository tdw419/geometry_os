; DESCRIPTION: Renders a red line between points (187, 136) and (114, 142).
; PLAN: r0=187(x1), r1=136(y1), r2=114(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 136
LDI r2, 114
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
