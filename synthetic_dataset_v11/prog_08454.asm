; DESCRIPTION: Draws a green line from (97, 161) to (57, 129).
; PLAN: r0=97(x1), r1=161(y1), r2=57(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 161
LDI r2, 57
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
