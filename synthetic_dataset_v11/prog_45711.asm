; DESCRIPTION: Renders a green line between points (192, 47) and (156, 15).
; PLAN: r0=192(x1), r1=47(y1), r2=156(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 47
LDI r2, 156
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
