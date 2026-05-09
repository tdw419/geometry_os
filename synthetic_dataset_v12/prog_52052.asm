; DESCRIPTION: Renders a magenta line between points (344, 232) and (432, 188).
; PLAN: r0=344(x1), r1=232(y1), r2=432(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 232
LDI r2, 432
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
