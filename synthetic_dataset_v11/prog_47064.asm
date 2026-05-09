; DESCRIPTION: Draws a white line from (93, 198) to (52, 123).
; PLAN: r0=93(x1), r1=198(y1), r2=52(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 198
LDI r2, 52
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
