; DESCRIPTION: Draws a green line from (340, 199) to (188, 224).
; PLAN: r0=340(x1), r1=199(y1), r2=188(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 199
LDI r2, 188
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
