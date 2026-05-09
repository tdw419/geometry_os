; DESCRIPTION: Draws a orange line from (200, 216) to (128, 36).
; PLAN: r0=200(x1), r1=216(y1), r2=128(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 216
LDI r2, 128
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
