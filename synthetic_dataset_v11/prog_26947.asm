; DESCRIPTION: Renders a green line between points (192, 139) and (154, 7).
; PLAN: r0=192(x1), r1=139(y1), r2=154(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 139
LDI r2, 154
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
