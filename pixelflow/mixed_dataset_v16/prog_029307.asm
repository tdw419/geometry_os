; DESCRIPTION: Draws a yellow line from (208, 209) to (318, 61).
; PLAN: r0=208(x1), r1=209(y1), r2=318(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 209
LDI r2, 318
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
