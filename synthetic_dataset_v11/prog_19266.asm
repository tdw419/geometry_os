; DESCRIPTION: Draws a green line from (246, 91) to (119, 34).
; PLAN: r0=246(x1), r1=91(y1), r2=119(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 91
LDI r2, 119
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
