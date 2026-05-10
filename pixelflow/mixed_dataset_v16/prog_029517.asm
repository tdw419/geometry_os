; DESCRIPTION: Renders a yellow line segment connecting (279, 97) to (177, 67).
; PLAN: r0=279(x1), r1=97(y1), r2=177(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 97
LDI r2, 177
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
