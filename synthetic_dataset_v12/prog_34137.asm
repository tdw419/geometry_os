; DESCRIPTION: Draws a purple line from (61, 203) to (125, 91).
; PLAN: r0=61(x1), r1=203(y1), r2=125(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 203
LDI r2, 125
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
