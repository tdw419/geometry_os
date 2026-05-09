; DESCRIPTION: Draws a purple line from (107, 105) to (59, 45).
; PLAN: r0=107(x1), r1=105(y1), r2=59(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 105
LDI r2, 59
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
