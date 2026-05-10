; DESCRIPTION: Renders a white line between points (164, 105) and (80, 189).
; PLAN: r0=164(x1), r1=105(y1), r2=80(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 105
LDI r2, 80
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
