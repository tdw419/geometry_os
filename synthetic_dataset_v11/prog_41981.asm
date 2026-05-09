; DESCRIPTION: Draws a purple line from (140, 6) to (206, 241).
; PLAN: r0=140(x1), r1=6(y1), r2=206(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 6
LDI r2, 206
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
