; DESCRIPTION: Renders a green line between points (156, 179) and (324, 81).
; PLAN: r0=156(x1), r1=179(y1), r2=324(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 179
LDI r2, 324
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
