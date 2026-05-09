; DESCRIPTION: Renders a white line between points (191, 33) and (11, 54).
; PLAN: r0=191(x1), r1=33(y1), r2=11(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 33
LDI r2, 11
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
