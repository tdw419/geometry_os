; DESCRIPTION: Renders a white line between points (229, 214) and (484, 49).
; PLAN: r0=229(x1), r1=214(y1), r2=484(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 214
LDI r2, 484
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
