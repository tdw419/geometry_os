; DESCRIPTION: Draws a orange line from (340, 246) to (192, 209).
; PLAN: r0=340(x1), r1=246(y1), r2=192(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 246
LDI r2, 192
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
