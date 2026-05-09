; DESCRIPTION: Draws a yellow line from (489, 37) to (118, 255).
; PLAN: r0=489(x1), r1=37(y1), r2=118(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 37
LDI r2, 118
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
