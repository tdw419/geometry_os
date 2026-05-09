; DESCRIPTION: Renders a white line between points (101, 162) and (19, 106).
; PLAN: r0=101(x1), r1=162(y1), r2=19(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 162
LDI r2, 19
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
