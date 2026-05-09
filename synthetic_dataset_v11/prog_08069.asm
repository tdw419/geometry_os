; DESCRIPTION: Renders a white line between points (100, 188) and (249, 33).
; PLAN: r0=100(x1), r1=188(y1), r2=249(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 188
LDI r2, 249
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
