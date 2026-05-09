; DESCRIPTION: Draws a yellow line from (109, 93) to (224, 72).
; PLAN: r0=109(x1), r1=93(y1), r2=224(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 93
LDI r2, 224
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
