; DESCRIPTION: Draws a purple line from (58, 50) to (81, 150).
; PLAN: r0=58(x1), r1=50(y1), r2=81(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 50
LDI r2, 81
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
