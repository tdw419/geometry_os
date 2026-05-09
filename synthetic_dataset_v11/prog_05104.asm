; DESCRIPTION: Renders a white line between points (218, 45) and (78, 205).
; PLAN: r0=218(x1), r1=45(y1), r2=78(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 45
LDI r2, 78
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
