; DESCRIPTION: Draws a yellow line from (238, 71) to (224, 246).
; PLAN: r0=238(x1), r1=71(y1), r2=224(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 71
LDI r2, 224
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
