; DESCRIPTION: Renders a green line between points (344, 137) and (304, 97).
; PLAN: r0=344(x1), r1=137(y1), r2=304(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 137
LDI r2, 304
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
