; DESCRIPTION: Draws a purple line from (150, 74) to (125, 143).
; PLAN: r0=150(x1), r1=74(y1), r2=125(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 74
LDI r2, 125
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
