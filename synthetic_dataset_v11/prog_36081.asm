; DESCRIPTION: Draws a cyan line from (224, 156) to (253, 2).
; PLAN: r0=224(x1), r1=156(y1), r2=253(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 156
LDI r2, 253
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
