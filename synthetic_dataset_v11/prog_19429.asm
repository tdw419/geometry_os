; DESCRIPTION: Renders a red line between points (141, 243) and (103, 3).
; PLAN: r0=141(x1), r1=243(y1), r2=103(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 243
LDI r2, 103
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
