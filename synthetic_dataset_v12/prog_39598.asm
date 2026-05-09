; DESCRIPTION: Draws a purple line from (402, 6) to (162, 28).
; PLAN: r0=402(x1), r1=6(y1), r2=162(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 6
LDI r2, 162
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
