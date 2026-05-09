; DESCRIPTION: Draws a yellow line from (30, 181) to (247, 249).
; PLAN: r0=30(x1), r1=181(y1), r2=247(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 181
LDI r2, 247
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
