; DESCRIPTION: Draws a yellow line from (501, 44) to (15, 176).
; PLAN: r0=501(x1), r1=44(y1), r2=15(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 44
LDI r2, 15
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
