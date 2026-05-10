; DESCRIPTION: Draws a purple line from (270, 176) to (26, 76).
; PLAN: r0=270(x1), r1=176(y1), r2=26(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 176
LDI r2, 26
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
