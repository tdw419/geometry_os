; DESCRIPTION: Renders a blue line between points (70, 237) and (119, 242).
; PLAN: r0=70(x1), r1=237(y1), r2=119(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 237
LDI r2, 119
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
