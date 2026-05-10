; DESCRIPTION: Draws a yellow line from (174, 211) to (76, 130).
; PLAN: r0=174(x1), r1=211(y1), r2=76(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 211
LDI r2, 76
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
