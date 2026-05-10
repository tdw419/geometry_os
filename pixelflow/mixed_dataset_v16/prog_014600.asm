; DESCRIPTION: Draws a orange line from (73, 26) to (456, 223).
; PLAN: r0=73(x1), r1=26(y1), r2=456(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 26
LDI r2, 456
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
