; DESCRIPTION: Draws a yellow line from (96, 104) to (224, 250).
; PLAN: r0=96(x1), r1=104(y1), r2=224(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 104
LDI r2, 224
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
