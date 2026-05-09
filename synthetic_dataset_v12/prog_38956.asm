; DESCRIPTION: Renders a orange line between points (482, 162) and (127, 122).
; PLAN: r0=482(x1), r1=162(y1), r2=127(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 162
LDI r2, 127
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
