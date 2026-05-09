; DESCRIPTION: Renders a green line between points (288, 122) and (344, 29).
; PLAN: r0=288(x1), r1=122(y1), r2=344(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 122
LDI r2, 344
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
