; DESCRIPTION: Draws a yellow line from (231, 113) to (236, 172).
; PLAN: r0=231(x1), r1=113(y1), r2=236(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 113
LDI r2, 236
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
