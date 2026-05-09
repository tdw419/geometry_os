; DESCRIPTION: Draws a orange line from (144, 151) to (341, 37).
; PLAN: r0=144(x1), r1=151(y1), r2=341(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 151
LDI r2, 341
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
