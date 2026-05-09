; DESCRIPTION: Draws a white line from (123, 174) to (484, 35).
; PLAN: r0=123(x1), r1=174(y1), r2=484(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 174
LDI r2, 484
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
