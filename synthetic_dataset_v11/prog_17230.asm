; DESCRIPTION: Draws a purple line from (30, 137) to (205, 103).
; PLAN: r0=30(x1), r1=137(y1), r2=205(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 137
LDI r2, 205
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
