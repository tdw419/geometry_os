; DESCRIPTION: Renders a white line between points (19, 142) and (72, 71).
; PLAN: r0=19(x1), r1=142(y1), r2=72(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 142
LDI r2, 72
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
