; DESCRIPTION: Renders a white line between points (242, 176) and (15, 118).
; PLAN: r0=242(x1), r1=176(y1), r2=15(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 176
LDI r2, 15
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
