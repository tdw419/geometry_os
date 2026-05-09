; DESCRIPTION: Draws a yellow line from (126, 190) to (225, 149).
; PLAN: r0=126(x1), r1=190(y1), r2=225(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 190
LDI r2, 225
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
