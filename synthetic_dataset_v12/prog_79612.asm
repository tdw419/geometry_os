; DESCRIPTION: Draws a orange line from (134, 152) to (379, 121).
; PLAN: r0=134(x1), r1=152(y1), r2=379(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 152
LDI r2, 379
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
