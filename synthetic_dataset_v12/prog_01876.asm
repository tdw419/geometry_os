; DESCRIPTION: Draws a yellow line from (260, 130) to (321, 224).
; PLAN: r0=260(x1), r1=130(y1), r2=321(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 130
LDI r2, 321
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
