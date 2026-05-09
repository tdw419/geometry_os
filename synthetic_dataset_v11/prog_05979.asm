; DESCRIPTION: Draws a orange line from (20, 16) to (133, 142).
; PLAN: r0=20(x1), r1=16(y1), r2=133(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 16
LDI r2, 133
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
