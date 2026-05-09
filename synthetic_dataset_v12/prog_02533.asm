; DESCRIPTION: Draws a yellow line from (213, 125) to (357, 63).
; PLAN: r0=213(x1), r1=125(y1), r2=357(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 125
LDI r2, 357
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
