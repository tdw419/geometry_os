; DESCRIPTION: Draws a white line from (155, 28) to (85, 123).
; PLAN: r0=155(x1), r1=28(y1), r2=85(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 28
LDI r2, 85
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
