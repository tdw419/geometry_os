; DESCRIPTION: Draws a yellow line from (364, 97) to (21, 68).
; PLAN: r0=364(x1), r1=97(y1), r2=21(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 97
LDI r2, 21
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
