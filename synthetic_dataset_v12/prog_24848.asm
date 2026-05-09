; DESCRIPTION: Draws a orange line from (380, 21) to (482, 81).
; PLAN: r0=380(x1), r1=21(y1), r2=482(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 21
LDI r2, 482
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
