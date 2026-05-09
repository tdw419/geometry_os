; DESCRIPTION: Renders a orange line between points (379, 3) and (456, 231).
; PLAN: r0=379(x1), r1=3(y1), r2=456(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 3
LDI r2, 456
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
