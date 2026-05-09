; DESCRIPTION: Draws a orange line from (213, 194) to (133, 153).
; PLAN: r0=213(x1), r1=194(y1), r2=133(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 194
LDI r2, 133
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
