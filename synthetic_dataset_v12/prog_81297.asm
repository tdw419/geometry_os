; DESCRIPTION: Renders a white line between points (457, 51) and (210, 49).
; PLAN: r0=457(x1), r1=51(y1), r2=210(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 51
LDI r2, 210
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
