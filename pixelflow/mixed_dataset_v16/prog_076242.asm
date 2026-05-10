; DESCRIPTION: Renders a green line between points (112, 153) and (224, 114).
; PLAN: r0=112(x1), r1=153(y1), r2=224(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 153
LDI r2, 224
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
