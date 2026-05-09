; DESCRIPTION: Renders a white line between points (54, 88) and (223, 171).
; PLAN: r0=54(x1), r1=88(y1), r2=223(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 88
LDI r2, 223
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
