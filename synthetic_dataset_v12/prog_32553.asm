; DESCRIPTION: Renders a yellow line between points (337, 224) and (208, 225).
; PLAN: r0=337(x1), r1=224(y1), r2=208(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 224
LDI r2, 208
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
