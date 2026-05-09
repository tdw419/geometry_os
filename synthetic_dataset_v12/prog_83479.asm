; DESCRIPTION: Draws a yellow line from (253, 60) to (272, 65).
; PLAN: r0=253(x1), r1=60(y1), r2=272(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 60
LDI r2, 272
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
