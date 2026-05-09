; DESCRIPTION: Renders a white line between points (491, 142) and (366, 109).
; PLAN: r0=491(x1), r1=142(y1), r2=366(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 142
LDI r2, 366
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
