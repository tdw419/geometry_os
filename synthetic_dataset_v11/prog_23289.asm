; DESCRIPTION: Draws a red line from (203, 86) to (186, 7).
; PLAN: r0=203(x1), r1=86(y1), r2=186(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 86
LDI r2, 186
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
