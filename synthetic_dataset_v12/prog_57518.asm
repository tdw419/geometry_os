; DESCRIPTION: Renders a blue line between points (194, 19) and (373, 187).
; PLAN: r0=194(x1), r1=19(y1), r2=373(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 19
LDI r2, 373
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
