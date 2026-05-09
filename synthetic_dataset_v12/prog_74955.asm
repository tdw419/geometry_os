; DESCRIPTION: Renders a green line between points (315, 78) and (349, 224).
; PLAN: r0=315(x1), r1=78(y1), r2=349(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 78
LDI r2, 349
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
