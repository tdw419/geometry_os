; DESCRIPTION: Renders a yellow line between points (243, 224) and (452, 80).
; PLAN: r0=243(x1), r1=224(y1), r2=452(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 224
LDI r2, 452
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
