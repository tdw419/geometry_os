; DESCRIPTION: Draws a purple line from (53, 10) to (413, 26).
; PLAN: r0=53(x1), r1=10(y1), r2=413(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 10
LDI r2, 413
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
