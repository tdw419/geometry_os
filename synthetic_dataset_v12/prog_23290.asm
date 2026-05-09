; DESCRIPTION: Draws a white line from (14, 181) to (105, 251).
; PLAN: r0=14(x1), r1=181(y1), r2=105(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 181
LDI r2, 105
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
