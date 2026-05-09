; DESCRIPTION: Draws a purple line from (33, 197) to (101, 33).
; PLAN: r0=33(x1), r1=197(y1), r2=101(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 197
LDI r2, 101
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
