; DESCRIPTION: Draws a yellow line from (43, 236) to (218, 159).
; PLAN: r0=43(x1), r1=236(y1), r2=218(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 236
LDI r2, 218
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
