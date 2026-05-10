; DESCRIPTION: Draws a purple line from (149, 116) to (286, 178).
; PLAN: r0=149(x1), r1=116(y1), r2=286(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 116
LDI r2, 286
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
