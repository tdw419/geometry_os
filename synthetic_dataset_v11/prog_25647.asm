; DESCRIPTION: Renders a white line between points (199, 118) and (161, 182).
; PLAN: r0=199(x1), r1=118(y1), r2=161(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 118
LDI r2, 161
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
