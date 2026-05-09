; DESCRIPTION: Renders a green line between points (242, 8) and (89, 26).
; PLAN: r0=242(x1), r1=8(y1), r2=89(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 8
LDI r2, 89
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
