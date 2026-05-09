; DESCRIPTION: Renders a yellow line between points (329, 60) and (355, 211).
; PLAN: r0=329(x1), r1=60(y1), r2=355(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 60
LDI r2, 355
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
