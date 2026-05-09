; DESCRIPTION: Draws a yellow line from (85, 13) to (373, 79).
; PLAN: r0=85(x1), r1=13(y1), r2=373(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 13
LDI r2, 373
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
