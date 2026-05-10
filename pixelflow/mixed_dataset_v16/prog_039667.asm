; DESCRIPTION: Draws a orange line from (464, 64) to (77, 252).
; PLAN: r0=464(x1), r1=64(y1), r2=77(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 64
LDI r2, 77
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
