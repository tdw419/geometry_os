; DESCRIPTION: Places a yellow line segment connecting (361, 28) to (224, 243).
; PLAN: r0=361(x1), r1=28(y1), r2=224(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 28
LDI r2, 224
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
