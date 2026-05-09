; DESCRIPTION: Renders a white line between points (78, 66) and (19, 249).
; PLAN: r0=78(x1), r1=66(y1), r2=19(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 66
LDI r2, 19
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
