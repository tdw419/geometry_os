; DESCRIPTION: Draws a green line from (12, 128) to (224, 188).
; PLAN: r0=12(x1), r1=128(y1), r2=224(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 128
LDI r2, 224
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
