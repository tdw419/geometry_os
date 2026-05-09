; DESCRIPTION: Renders a green line between points (105, 237) and (119, 70).
; PLAN: r0=105(x1), r1=237(y1), r2=119(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 237
LDI r2, 119
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
