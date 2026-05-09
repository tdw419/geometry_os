; DESCRIPTION: Draws a yellow line from (463, 167) to (359, 208).
; PLAN: r0=463(x1), r1=167(y1), r2=359(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 167
LDI r2, 359
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
