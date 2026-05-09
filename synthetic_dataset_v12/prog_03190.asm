; DESCRIPTION: Draws a purple line from (108, 17) to (183, 108).
; PLAN: r0=108(x1), r1=17(y1), r2=183(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 17
LDI r2, 183
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
