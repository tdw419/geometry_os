; DESCRIPTION: Draws a white line from (129, 159) to (91, 227).
; PLAN: r0=129(x1), r1=159(y1), r2=91(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 159
LDI r2, 91
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
