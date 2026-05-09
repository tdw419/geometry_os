; DESCRIPTION: Renders a white line between points (112, 135) and (355, 220).
; PLAN: r0=112(x1), r1=135(y1), r2=355(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 135
LDI r2, 355
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
