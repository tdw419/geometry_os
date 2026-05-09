; DESCRIPTION: Draws a blue line from (231, 167) to (463, 254).
; PLAN: r0=231(x1), r1=167(y1), r2=463(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 167
LDI r2, 463
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
