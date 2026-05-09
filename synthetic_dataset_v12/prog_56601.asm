; DESCRIPTION: Draws a purple line from (402, 242) to (279, 123).
; PLAN: r0=402(x1), r1=242(y1), r2=279(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 242
LDI r2, 279
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
