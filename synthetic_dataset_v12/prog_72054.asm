; DESCRIPTION: Renders a white line between points (38, 243) and (177, 78).
; PLAN: r0=38(x1), r1=243(y1), r2=177(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 243
LDI r2, 177
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
