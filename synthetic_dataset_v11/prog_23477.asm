; DESCRIPTION: Draws a purple line from (92, 224) to (168, 232).
; PLAN: r0=92(x1), r1=224(y1), r2=168(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 224
LDI r2, 168
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
