; DESCRIPTION: Draws a purple line from (246, 207) to (183, 33).
; PLAN: r0=246(x1), r1=207(y1), r2=183(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 207
LDI r2, 183
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
