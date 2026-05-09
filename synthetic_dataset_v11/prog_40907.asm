; DESCRIPTION: Draws a yellow line from (205, 161) to (183, 248).
; PLAN: r0=205(x1), r1=161(y1), r2=183(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 161
LDI r2, 183
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
