; DESCRIPTION: Renders a green line between points (141, 109) and (74, 162).
; PLAN: r0=141(x1), r1=109(y1), r2=74(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 109
LDI r2, 74
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
