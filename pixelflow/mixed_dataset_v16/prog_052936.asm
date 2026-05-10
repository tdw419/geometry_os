; DESCRIPTION: Renders a purple line between points (344, 125) and (200, 198).
; PLAN: r0=344(x1), r1=125(y1), r2=200(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 125
LDI r2, 200
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
