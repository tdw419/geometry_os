; DESCRIPTION: Draws a yellow line from (32, 107) to (351, 105).
; PLAN: r0=32(x1), r1=107(y1), r2=351(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 107
LDI r2, 351
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
