; DESCRIPTION: Draws a purple line from (330, 184) to (130, 76).
; PLAN: r0=330(x1), r1=184(y1), r2=130(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 184
LDI r2, 130
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
