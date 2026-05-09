; DESCRIPTION: Draws a white line from (79, 200) to (24, 251).
; PLAN: r0=79(x1), r1=200(y1), r2=24(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 200
LDI r2, 24
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
