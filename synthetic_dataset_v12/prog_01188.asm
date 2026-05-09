; DESCRIPTION: Draws a purple line from (276, 125) to (510, 89).
; PLAN: r0=276(x1), r1=125(y1), r2=510(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 125
LDI r2, 510
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
