; DESCRIPTION: Renders a blue line between points (192, 44) and (0, 30).
; PLAN: r0=192(x1), r1=44(y1), r2=0(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 44
LDI r2, 0
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
