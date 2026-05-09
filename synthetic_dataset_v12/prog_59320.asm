; DESCRIPTION: Draws a yellow line from (224, 85) to (364, 47).
; PLAN: r0=224(x1), r1=85(y1), r2=364(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 85
LDI r2, 364
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
