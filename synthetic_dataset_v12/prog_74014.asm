; DESCRIPTION: Draws a orange line from (125, 98) to (482, 43).
; PLAN: r0=125(x1), r1=98(y1), r2=482(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 98
LDI r2, 482
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
