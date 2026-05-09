; DESCRIPTION: Renders a blue line between points (224, 193) and (329, 77).
; PLAN: r0=224(x1), r1=193(y1), r2=329(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 193
LDI r2, 329
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
