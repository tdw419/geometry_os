; DESCRIPTION: Draws a purple line from (189, 96) to (442, 200).
; PLAN: r0=189(x1), r1=96(y1), r2=442(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 96
LDI r2, 442
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
