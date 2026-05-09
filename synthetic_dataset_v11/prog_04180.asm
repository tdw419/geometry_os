; DESCRIPTION: Draws a black line from (159, 198) to (231, 127).
; PLAN: r0=159(x1), r1=198(y1), r2=231(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 198
LDI r2, 231
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
