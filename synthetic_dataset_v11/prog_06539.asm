; DESCRIPTION: Draws a green line from (97, 18) to (31, 189).
; PLAN: r0=97(x1), r1=18(y1), r2=31(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 18
LDI r2, 31
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
