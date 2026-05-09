; DESCRIPTION: Renders a purple line between points (224, 177) and (46, 40).
; PLAN: r0=224(x1), r1=177(y1), r2=46(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 177
LDI r2, 46
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
