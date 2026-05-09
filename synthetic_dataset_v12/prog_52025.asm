; DESCRIPTION: Renders a magenta line between points (137, 200) and (344, 250).
; PLAN: r0=137(x1), r1=200(y1), r2=344(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 200
LDI r2, 344
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
