; DESCRIPTION: Draws a purple line from (284, 137) to (134, 170).
; PLAN: r0=284(x1), r1=137(y1), r2=134(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 137
LDI r2, 134
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
