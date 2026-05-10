; DESCRIPTION: Draws a orange line from (374, 140) to (453, 150).
; PLAN: r0=374(x1), r1=140(y1), r2=453(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 140
LDI r2, 453
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
