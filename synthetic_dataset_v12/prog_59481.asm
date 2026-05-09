; DESCRIPTION: Renders a white line between points (191, 45) and (226, 167).
; PLAN: r0=191(x1), r1=45(y1), r2=226(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 45
LDI r2, 226
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
