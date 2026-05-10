; DESCRIPTION: Draws a yellow line from (282, 115) to (224, 47).
; PLAN: r0=282(x1), r1=115(y1), r2=224(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 115
LDI r2, 224
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
