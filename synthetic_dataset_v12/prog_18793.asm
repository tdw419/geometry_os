; DESCRIPTION: Renders a white line between points (297, 155) and (344, 3).
; PLAN: r0=297(x1), r1=155(y1), r2=344(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 155
LDI r2, 344
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
