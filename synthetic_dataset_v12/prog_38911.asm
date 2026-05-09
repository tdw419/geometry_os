; DESCRIPTION: Renders a red line between points (223, 202) and (488, 201).
; PLAN: r0=223(x1), r1=202(y1), r2=488(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 202
LDI r2, 488
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
