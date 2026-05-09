; DESCRIPTION: Renders a white line between points (244, 161) and (71, 218).
; PLAN: r0=244(x1), r1=161(y1), r2=71(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 161
LDI r2, 71
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
