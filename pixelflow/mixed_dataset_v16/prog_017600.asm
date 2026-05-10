; DESCRIPTION: Draws a white line from (51, 34) to (176, 66).
; PLAN: r0=51(x1), r1=34(y1), r2=176(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 34
LDI r2, 176
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
