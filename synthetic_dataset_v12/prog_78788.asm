; DESCRIPTION: Renders a white line between points (278, 22) and (252, 34).
; PLAN: r0=278(x1), r1=22(y1), r2=252(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 22
LDI r2, 252
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
