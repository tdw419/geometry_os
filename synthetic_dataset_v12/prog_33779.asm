; DESCRIPTION: Draws a purple line from (268, 77) to (159, 173).
; PLAN: r0=268(x1), r1=77(y1), r2=159(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 77
LDI r2, 159
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
