; DESCRIPTION: Renders a green line between points (242, 13) and (128, 118).
; PLAN: r0=242(x1), r1=13(y1), r2=128(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 13
LDI r2, 128
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
