; DESCRIPTION: Renders a yellow line between points (417, 14) and (210, 224).
; PLAN: r0=417(x1), r1=14(y1), r2=210(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 14
LDI r2, 210
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
