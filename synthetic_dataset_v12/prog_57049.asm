; DESCRIPTION: Renders a white line between points (299, 148) and (395, 119).
; PLAN: r0=299(x1), r1=148(y1), r2=395(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 148
LDI r2, 395
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
