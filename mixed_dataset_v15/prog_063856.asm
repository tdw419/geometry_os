; DESCRIPTION: Draws a orange line from (133, 98) to (220, 165).
; PLAN: r0=133(x1), r1=98(y1), r2=220(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 98
LDI r2, 220
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
