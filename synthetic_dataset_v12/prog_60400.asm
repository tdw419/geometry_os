; DESCRIPTION: Draws a green line from (144, 101) to (231, 17).
; PLAN: r0=144(x1), r1=101(y1), r2=231(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 101
LDI r2, 231
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
