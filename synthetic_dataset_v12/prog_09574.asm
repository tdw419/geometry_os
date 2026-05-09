; DESCRIPTION: Draws a purple line from (281, 107) to (227, 188).
; PLAN: r0=281(x1), r1=107(y1), r2=227(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 107
LDI r2, 227
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
