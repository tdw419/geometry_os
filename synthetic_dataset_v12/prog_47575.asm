; DESCRIPTION: Draws a purple line from (265, 223) to (303, 165).
; PLAN: r0=265(x1), r1=223(y1), r2=303(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 223
LDI r2, 303
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
