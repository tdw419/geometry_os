; DESCRIPTION: Renders a white line between points (93, 214) and (411, 167).
; PLAN: r0=93(x1), r1=214(y1), r2=411(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 214
LDI r2, 411
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
