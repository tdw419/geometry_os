; DESCRIPTION: Draws a white line from (333, 89) to (54, 159).
; PLAN: r0=333(x1), r1=89(y1), r2=54(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 89
LDI r2, 54
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
