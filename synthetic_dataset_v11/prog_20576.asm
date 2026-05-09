; DESCRIPTION: Renders a yellow line between points (87, 107) and (137, 224).
; PLAN: r0=87(x1), r1=107(y1), r2=137(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 107
LDI r2, 137
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
