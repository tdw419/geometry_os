; DESCRIPTION: Draws a green line from (190, 46) to (94, 188).
; PLAN: r0=190(x1), r1=46(y1), r2=94(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 46
LDI r2, 94
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
