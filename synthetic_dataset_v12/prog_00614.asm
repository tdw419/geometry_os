; DESCRIPTION: Draws a orange line from (482, 59) to (454, 232).
; PLAN: r0=482(x1), r1=59(y1), r2=454(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 59
LDI r2, 454
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
