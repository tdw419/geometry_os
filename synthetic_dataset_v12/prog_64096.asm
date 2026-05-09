; DESCRIPTION: Draws a purple line from (159, 210) to (281, 58).
; PLAN: r0=159(x1), r1=210(y1), r2=281(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 210
LDI r2, 281
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
