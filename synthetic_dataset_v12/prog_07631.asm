; DESCRIPTION: Draws a yellow line from (224, 151) to (270, 82).
; PLAN: r0=224(x1), r1=151(y1), r2=270(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 151
LDI r2, 270
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
