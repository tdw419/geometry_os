; DESCRIPTION: Draws a magenta line from (509, 246) to (353, 224).
; PLAN: r0=509(x1), r1=246(y1), r2=353(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 246
LDI r2, 353
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
