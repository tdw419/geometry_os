; DESCRIPTION: Draws a orange line from (214, 86) to (8, 158).
; PLAN: r0=214(x1), r1=86(y1), r2=8(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 86
LDI r2, 8
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
