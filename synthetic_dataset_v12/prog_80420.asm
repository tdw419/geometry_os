; DESCRIPTION: Draws a purple line from (71, 8) to (160, 30).
; PLAN: r0=71(x1), r1=8(y1), r2=160(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 8
LDI r2, 160
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
