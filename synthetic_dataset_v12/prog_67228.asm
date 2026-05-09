; DESCRIPTION: Renders a black line between points (344, 205) and (369, 70).
; PLAN: r0=344(x1), r1=205(y1), r2=369(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 205
LDI r2, 369
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
