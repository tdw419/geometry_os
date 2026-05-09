; DESCRIPTION: Draws a orange line from (184, 173) to (189, 81).
; PLAN: r0=184(x1), r1=173(y1), r2=189(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 173
LDI r2, 189
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
