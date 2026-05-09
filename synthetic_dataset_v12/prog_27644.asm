; DESCRIPTION: Renders a orange line between points (322, 86) and (306, 224).
; PLAN: r0=322(x1), r1=86(y1), r2=306(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 86
LDI r2, 306
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
