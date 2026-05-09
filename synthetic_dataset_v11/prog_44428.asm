; DESCRIPTION: Places a purple line segment connecting (90, 11) to (242, 237).
; PLAN: r0=90(x1), r1=11(y1), r2=242(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 11
LDI r2, 242
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
