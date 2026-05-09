; DESCRIPTION: Draws a orange line from (326, 64) to (156, 74).
; PLAN: r0=326(x1), r1=64(y1), r2=156(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 64
LDI r2, 156
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
