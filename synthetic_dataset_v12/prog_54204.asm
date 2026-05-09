; DESCRIPTION: Draws a green line from (472, 36) to (345, 159).
; PLAN: r0=472(x1), r1=36(y1), r2=345(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 36
LDI r2, 345
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
