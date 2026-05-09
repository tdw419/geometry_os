; DESCRIPTION: Renders a white line between points (201, 135) and (74, 167).
; PLAN: r0=201(x1), r1=135(y1), r2=74(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 135
LDI r2, 74
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
