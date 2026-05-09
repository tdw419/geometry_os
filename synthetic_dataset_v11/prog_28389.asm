; DESCRIPTION: Draws a yellow line from (15, 83) to (224, 146).
; PLAN: r0=15(x1), r1=83(y1), r2=224(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 83
LDI r2, 224
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
