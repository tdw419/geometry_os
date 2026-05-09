; DESCRIPTION: Draws a white line from (93, 181) to (491, 74).
; PLAN: r0=93(x1), r1=181(y1), r2=491(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 181
LDI r2, 491
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
