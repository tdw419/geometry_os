; DESCRIPTION: Draws a yellow line from (190, 32) to (244, 252).
; PLAN: r0=190(x1), r1=32(y1), r2=244(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 32
LDI r2, 244
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
