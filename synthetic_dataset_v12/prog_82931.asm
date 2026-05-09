; DESCRIPTION: Draws a orange line from (114, 53) to (394, 252).
; PLAN: r0=114(x1), r1=53(y1), r2=394(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 53
LDI r2, 394
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
