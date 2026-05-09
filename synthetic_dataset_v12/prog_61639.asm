; DESCRIPTION: Renders a white line between points (291, 3) and (158, 110).
; PLAN: r0=291(x1), r1=3(y1), r2=158(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 3
LDI r2, 158
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
