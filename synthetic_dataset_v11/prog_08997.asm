; DESCRIPTION: Draws a green line from (133, 185) to (172, 15).
; PLAN: r0=133(x1), r1=185(y1), r2=172(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 185
LDI r2, 172
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
