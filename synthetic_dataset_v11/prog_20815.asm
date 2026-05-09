; DESCRIPTION: Renders a green line between points (7, 8) and (242, 158).
; PLAN: r0=7(x1), r1=8(y1), r2=242(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 8
LDI r2, 242
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
