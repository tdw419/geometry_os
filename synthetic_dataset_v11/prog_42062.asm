; DESCRIPTION: Draws a purple line from (27, 7) to (227, 50).
; PLAN: r0=27(x1), r1=7(y1), r2=227(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 7
LDI r2, 227
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
