; DESCRIPTION: Draws a orange line from (184, 176) to (117, 64).
; PLAN: r0=184(x1), r1=176(y1), r2=117(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 176
LDI r2, 117
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
