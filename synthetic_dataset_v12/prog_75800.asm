; DESCRIPTION: Draws a blue line from (281, 198) to (378, 12).
; PLAN: r0=281(x1), r1=198(y1), r2=378(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 198
LDI r2, 378
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
