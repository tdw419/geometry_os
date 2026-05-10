; DESCRIPTION: Draws a white line from (344, 1) to (369, 90).
; PLAN: r0=344(x1), r1=1(y1), r2=369(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 1
LDI r2, 369
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
