; DESCRIPTION: Draws a yellow line from (130, 91) to (75, 248).
; PLAN: r0=130(x1), r1=91(y1), r2=75(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 91
LDI r2, 75
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
