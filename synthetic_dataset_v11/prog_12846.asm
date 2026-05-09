; DESCRIPTION: Renders a magenta line between points (119, 2) and (242, 129).
; PLAN: r0=119(x1), r1=2(y1), r2=242(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 2
LDI r2, 242
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
