; DESCRIPTION: Draws a yellow line from (74, 250) to (231, 43).
; PLAN: r0=74(x1), r1=250(y1), r2=231(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 250
LDI r2, 231
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
