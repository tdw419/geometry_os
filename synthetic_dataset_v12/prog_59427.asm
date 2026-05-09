; DESCRIPTION: Renders a white line between points (472, 139) and (304, 110).
; PLAN: r0=472(x1), r1=139(y1), r2=304(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 139
LDI r2, 304
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
