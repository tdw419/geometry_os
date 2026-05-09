; DESCRIPTION: Draws a yellow line from (318, 253) to (374, 199).
; PLAN: r0=318(x1), r1=253(y1), r2=374(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 253
LDI r2, 374
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
