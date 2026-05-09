; DESCRIPTION: Draws a purple line from (121, 245) to (474, 50).
; PLAN: r0=121(x1), r1=245(y1), r2=474(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 245
LDI r2, 474
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
