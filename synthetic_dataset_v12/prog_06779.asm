; DESCRIPTION: Renders a white line between points (78, 145) and (78, 16).
; PLAN: r0=78(x1), r1=145(y1), r2=78(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 145
LDI r2, 78
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
