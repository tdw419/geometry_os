; DESCRIPTION: Renders a white line between points (282, 251) and (123, 218).
; PLAN: r0=282(x1), r1=251(y1), r2=123(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 251
LDI r2, 123
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
