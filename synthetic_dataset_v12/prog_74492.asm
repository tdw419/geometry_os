; DESCRIPTION: Renders a white line between points (54, 185) and (248, 141).
; PLAN: r0=54(x1), r1=185(y1), r2=248(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 185
LDI r2, 248
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
