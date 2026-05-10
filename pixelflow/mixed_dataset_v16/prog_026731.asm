; DESCRIPTION: Draws a yellow line from (264, 252) to (363, 74).
; PLAN: r0=264(x1), r1=252(y1), r2=363(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 252
LDI r2, 363
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
