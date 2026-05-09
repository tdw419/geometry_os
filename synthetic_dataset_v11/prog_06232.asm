; DESCRIPTION: Draws a orange line from (68, 16) to (252, 32).
; PLAN: r0=68(x1), r1=16(y1), r2=252(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 16
LDI r2, 252
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
