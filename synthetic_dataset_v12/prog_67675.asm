; DESCRIPTION: Draws a yellow line from (181, 22) to (326, 95).
; PLAN: r0=181(x1), r1=22(y1), r2=326(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 22
LDI r2, 326
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
