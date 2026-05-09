; DESCRIPTION: Draws a yellow line from (444, 203) to (95, 37).
; PLAN: r0=444(x1), r1=203(y1), r2=95(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 203
LDI r2, 95
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
