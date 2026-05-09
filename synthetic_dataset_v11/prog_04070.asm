; DESCRIPTION: Draws a yellow line from (150, 191) to (130, 248).
; PLAN: r0=150(x1), r1=191(y1), r2=130(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 191
LDI r2, 130
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
