; DESCRIPTION: Draws a orange line from (112, 176) to (64, 158).
; PLAN: r0=112(x1), r1=176(y1), r2=64(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 176
LDI r2, 64
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
