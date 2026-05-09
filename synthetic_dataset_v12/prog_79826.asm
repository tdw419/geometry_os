; DESCRIPTION: Draws a purple line from (438, 153) to (104, 0).
; PLAN: r0=438(x1), r1=153(y1), r2=104(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 153
LDI r2, 104
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
