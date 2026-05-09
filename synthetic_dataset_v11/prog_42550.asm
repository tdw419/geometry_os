; DESCRIPTION: Renders a purple line between points (128, 224) and (174, 108).
; PLAN: r0=128(x1), r1=224(y1), r2=174(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 224
LDI r2, 174
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
