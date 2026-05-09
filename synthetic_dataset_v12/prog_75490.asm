; DESCRIPTION: Draws a purple line from (413, 25) to (245, 38).
; PLAN: r0=413(x1), r1=25(y1), r2=245(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 25
LDI r2, 245
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
