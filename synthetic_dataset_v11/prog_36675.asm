; DESCRIPTION: Renders a green line between points (144, 2) and (194, 242).
; PLAN: r0=144(x1), r1=2(y1), r2=194(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 2
LDI r2, 194
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
