; DESCRIPTION: Renders a white line between points (76, 172) and (219, 13).
; PLAN: r0=76(x1), r1=172(y1), r2=219(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 172
LDI r2, 219
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
