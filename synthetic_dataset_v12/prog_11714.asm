; DESCRIPTION: Renders a yellow line between points (324, 176) and (247, 143).
; PLAN: r0=324(x1), r1=176(y1), r2=247(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 176
LDI r2, 247
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
