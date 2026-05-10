; DESCRIPTION: Draws a green line from (183, 217) to (129, 160).
; PLAN: r0=183(x1), r1=217(y1), r2=129(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 217
LDI r2, 129
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
