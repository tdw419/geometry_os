; DESCRIPTION: Draws a purple line from (10, 174) to (21, 76).
; PLAN: r0=10(x1), r1=174(y1), r2=21(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 174
LDI r2, 21
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
