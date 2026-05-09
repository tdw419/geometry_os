; DESCRIPTION: Renders a blue line between points (49, 224) and (186, 117).
; PLAN: r0=49(x1), r1=224(y1), r2=186(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 224
LDI r2, 186
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
