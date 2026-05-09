; DESCRIPTION: Draws a green line from (224, 35) to (28, 140).
; PLAN: r0=224(x1), r1=35(y1), r2=28(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 35
LDI r2, 28
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
