; DESCRIPTION: Renders a green line between points (212, 91) and (15, 188).
; PLAN: r0=212(x1), r1=91(y1), r2=15(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 91
LDI r2, 15
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
