; DESCRIPTION: Renders a purple line between points (207, 203) and (242, 222).
; PLAN: r0=207(x1), r1=203(y1), r2=242(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 203
LDI r2, 242
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
