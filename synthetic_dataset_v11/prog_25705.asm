; DESCRIPTION: Draws a purple line from (185, 203) to (242, 72).
; PLAN: r0=185(x1), r1=203(y1), r2=242(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 203
LDI r2, 242
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
