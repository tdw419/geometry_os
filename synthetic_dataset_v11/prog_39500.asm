; DESCRIPTION: Renders a white line between points (96, 118) and (224, 155).
; PLAN: r0=96(x1), r1=118(y1), r2=224(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 118
LDI r2, 224
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
