; DESCRIPTION: Renders a white line between points (164, 21) and (471, 181).
; PLAN: r0=164(x1), r1=21(y1), r2=471(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 21
LDI r2, 471
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
