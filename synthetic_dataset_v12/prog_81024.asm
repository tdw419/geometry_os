; DESCRIPTION: Renders a blue line between points (1, 173) and (344, 217).
; PLAN: r0=1(x1), r1=173(y1), r2=344(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 173
LDI r2, 344
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
