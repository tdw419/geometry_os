; DESCRIPTION: Draws a green line from (190, 91) to (140, 139).
; PLAN: r0=190(x1), r1=91(y1), r2=140(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 91
LDI r2, 140
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
