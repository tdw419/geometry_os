; DESCRIPTION: Draws a orange line from (204, 223) to (161, 139).
; PLAN: r0=204(x1), r1=223(y1), r2=161(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 223
LDI r2, 161
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
