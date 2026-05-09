; DESCRIPTION: Draws a orange line from (252, 7) to (98, 128).
; PLAN: r0=252(x1), r1=7(y1), r2=98(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 7
LDI r2, 98
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
