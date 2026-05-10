; DESCRIPTION: Renders a cyan line segment connecting (192, 83) to (71, 148).
; PLAN: r0=192(x1), r1=83(y1), r2=71(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 83
LDI r2, 71
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
