; DESCRIPTION: Renders a white line between points (108, 54) and (355, 142).
; PLAN: r0=108(x1), r1=54(y1), r2=355(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 54
LDI r2, 355
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
