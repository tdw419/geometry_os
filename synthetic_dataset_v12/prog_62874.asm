; DESCRIPTION: Renders a white line between points (102, 141) and (251, 162).
; PLAN: r0=102(x1), r1=141(y1), r2=251(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 141
LDI r2, 251
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
