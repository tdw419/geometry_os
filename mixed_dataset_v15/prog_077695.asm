; DESCRIPTION: Renders a white line between points (77, 76) and (33, 14).
; PLAN: r0=77(x1), r1=76(y1), r2=33(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 76
LDI r2, 33
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
