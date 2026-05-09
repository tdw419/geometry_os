; DESCRIPTION: Draws a orange line from (205, 179) to (385, 220).
; PLAN: r0=205(x1), r1=179(y1), r2=385(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 179
LDI r2, 385
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
