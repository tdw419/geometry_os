; DESCRIPTION: Renders a green line between points (251, 32) and (339, 138).
; PLAN: r0=251(x1), r1=32(y1), r2=339(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 32
LDI r2, 339
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
