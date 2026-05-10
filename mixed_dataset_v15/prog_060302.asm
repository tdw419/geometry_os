; DESCRIPTION: Draws a purple line from (353, 242) to (357, 48).
; PLAN: r0=353(x1), r1=242(y1), r2=357(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 242
LDI r2, 357
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
