; DESCRIPTION: Renders a white line between points (216, 125) and (224, 11).
; PLAN: r0=216(x1), r1=125(y1), r2=224(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 125
LDI r2, 224
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
