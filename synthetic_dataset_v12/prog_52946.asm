; DESCRIPTION: Renders a yellow line between points (344, 25) and (118, 144).
; PLAN: r0=344(x1), r1=25(y1), r2=118(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 25
LDI r2, 118
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
