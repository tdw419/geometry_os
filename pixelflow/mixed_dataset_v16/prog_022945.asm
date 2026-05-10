; DESCRIPTION: Renders a white line between points (80, 22) and (219, 217).
; PLAN: r0=80(x1), r1=22(y1), r2=219(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 22
LDI r2, 219
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
