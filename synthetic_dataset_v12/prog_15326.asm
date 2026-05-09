; DESCRIPTION: Draws a white line from (429, 252) to (496, 74).
; PLAN: r0=429(x1), r1=252(y1), r2=496(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 252
LDI r2, 496
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
