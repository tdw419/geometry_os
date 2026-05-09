; DESCRIPTION: Draws a white line from (123, 35) to (118, 137).
; PLAN: r0=123(x1), r1=35(y1), r2=118(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 35
LDI r2, 118
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
