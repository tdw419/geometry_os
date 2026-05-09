; DESCRIPTION: Renders a orange line between points (482, 84) and (475, 243).
; PLAN: r0=482(x1), r1=84(y1), r2=475(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 84
LDI r2, 475
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
