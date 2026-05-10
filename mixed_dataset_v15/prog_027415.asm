; DESCRIPTION: Draws a orange line from (237, 63) to (125, 39).
; PLAN: r0=237(x1), r1=63(y1), r2=125(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 63
LDI r2, 125
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
