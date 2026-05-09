; DESCRIPTION: Renders a orange line between points (157, 138) and (224, 118).
; PLAN: r0=157(x1), r1=138(y1), r2=224(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 138
LDI r2, 224
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
