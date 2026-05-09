; DESCRIPTION: Draws a orange line from (8, 47) to (221, 136).
; PLAN: r0=8(x1), r1=47(y1), r2=221(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 47
LDI r2, 221
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
