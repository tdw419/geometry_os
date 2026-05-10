; DESCRIPTION: Draws a orange line from (68, 101) to (111, 64).
; PLAN: r0=68(x1), r1=101(y1), r2=111(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 101
LDI r2, 111
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
