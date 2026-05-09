; DESCRIPTION: Renders a white line between points (172, 198) and (262, 71).
; PLAN: r0=172(x1), r1=198(y1), r2=262(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 198
LDI r2, 262
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
