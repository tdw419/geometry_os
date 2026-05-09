; DESCRIPTION: Draws a white line from (5, 118) to (251, 148).
; PLAN: r0=5(x1), r1=118(y1), r2=251(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 118
LDI r2, 251
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
