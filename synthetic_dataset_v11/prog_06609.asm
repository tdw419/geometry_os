; DESCRIPTION: Renders a white line between points (142, 101) and (22, 178).
; PLAN: r0=142(x1), r1=101(y1), r2=22(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 101
LDI r2, 22
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
