; DESCRIPTION: Draws a orange line from (125, 1) to (319, 237).
; PLAN: r0=125(x1), r1=1(y1), r2=319(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 1
LDI r2, 319
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
