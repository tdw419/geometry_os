; DESCRIPTION: Draws a green line from (31, 129) to (438, 149).
; PLAN: r0=31(x1), r1=129(y1), r2=438(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 129
LDI r2, 438
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
