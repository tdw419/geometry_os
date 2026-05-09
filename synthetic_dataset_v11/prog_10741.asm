; DESCRIPTION: Draws a purple line from (183, 46) to (54, 207).
; PLAN: r0=183(x1), r1=46(y1), r2=54(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 46
LDI r2, 54
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
