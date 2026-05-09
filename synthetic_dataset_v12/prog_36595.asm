; DESCRIPTION: Draws a yellow line from (425, 58) to (351, 70).
; PLAN: r0=425(x1), r1=58(y1), r2=351(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 58
LDI r2, 351
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
