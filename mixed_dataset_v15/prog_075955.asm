; DESCRIPTION: Draws a orange line from (239, 35) to (379, 158).
; PLAN: r0=239(x1), r1=35(y1), r2=379(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 35
LDI r2, 379
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
