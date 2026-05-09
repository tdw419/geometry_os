; DESCRIPTION: Renders a white line between points (149, 104) and (249, 19).
; PLAN: r0=149(x1), r1=104(y1), r2=249(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 104
LDI r2, 249
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
