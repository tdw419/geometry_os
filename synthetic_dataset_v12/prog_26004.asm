; DESCRIPTION: Renders a white line between points (492, 218) and (161, 250).
; PLAN: r0=492(x1), r1=218(y1), r2=161(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 218
LDI r2, 161
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
