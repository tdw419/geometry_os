; DESCRIPTION: Renders a white line between points (328, 146) and (227, 162).
; PLAN: r0=328(x1), r1=146(y1), r2=227(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 146
LDI r2, 227
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
