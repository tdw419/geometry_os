; DESCRIPTION: Draws a white line from (25, 186) to (181, 251).
; PLAN: r0=25(x1), r1=186(y1), r2=181(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 186
LDI r2, 181
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
