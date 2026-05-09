; DESCRIPTION: Draws a yellow line from (8, 2) to (252, 180).
; PLAN: r0=8(x1), r1=2(y1), r2=252(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 2
LDI r2, 252
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
