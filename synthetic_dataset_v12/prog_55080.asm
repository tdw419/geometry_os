; DESCRIPTION: Draws a purple line from (499, 24) to (290, 41).
; PLAN: r0=499(x1), r1=24(y1), r2=290(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 24
LDI r2, 290
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
