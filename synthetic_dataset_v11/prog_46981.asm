; DESCRIPTION: Draws a white line from (36, 149) to (163, 110).
; PLAN: r0=36(x1), r1=149(y1), r2=163(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 149
LDI r2, 163
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
