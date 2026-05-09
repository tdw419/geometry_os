; DESCRIPTION: Draws a green line from (19, 71) to (438, 129).
; PLAN: r0=19(x1), r1=71(y1), r2=438(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 71
LDI r2, 438
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
