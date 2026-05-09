; DESCRIPTION: Draws a yellow line from (77, 10) to (319, 130).
; PLAN: r0=77(x1), r1=10(y1), r2=319(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 10
LDI r2, 319
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
