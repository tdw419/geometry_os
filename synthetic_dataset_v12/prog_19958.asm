; DESCRIPTION: Draws a yellow line from (52, 174) to (128, 245).
; PLAN: r0=52(x1), r1=174(y1), r2=128(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 174
LDI r2, 128
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
