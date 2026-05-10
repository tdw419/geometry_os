; DESCRIPTION: Draws a purple line from (224, 168) to (68, 138).
; PLAN: r0=224(x1), r1=168(y1), r2=68(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 168
LDI r2, 68
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
