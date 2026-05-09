; DESCRIPTION: Renders a red line between points (19, 10) and (33, 211).
; PLAN: r0=19(x1), r1=10(y1), r2=33(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 10
LDI r2, 33
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
