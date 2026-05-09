; DESCRIPTION: Renders a white line between points (123, 221) and (172, 145).
; PLAN: r0=123(x1), r1=221(y1), r2=172(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 221
LDI r2, 172
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
