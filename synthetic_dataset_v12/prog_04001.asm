; DESCRIPTION: Draws a orange line from (32, 115) to (377, 135).
; PLAN: r0=32(x1), r1=115(y1), r2=377(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 115
LDI r2, 377
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
