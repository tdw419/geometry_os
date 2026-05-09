; DESCRIPTION: Renders a white line between points (22, 56) and (212, 104).
; PLAN: r0=22(x1), r1=56(y1), r2=212(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 56
LDI r2, 212
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
