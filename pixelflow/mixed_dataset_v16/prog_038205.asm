; DESCRIPTION: Draws a green line from (456, 175) to (147, 211).
; PLAN: r0=456(x1), r1=175(y1), r2=147(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 175
LDI r2, 147
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
