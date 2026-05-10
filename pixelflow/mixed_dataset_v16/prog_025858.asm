; DESCRIPTION: Renders a white line between points (437, 140) and (506, 75).
; PLAN: r0=437(x1), r1=140(y1), r2=506(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 140
LDI r2, 506
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
