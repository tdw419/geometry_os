; DESCRIPTION: Renders a yellow line between points (156, 144) and (247, 239).
; PLAN: r0=156(x1), r1=144(y1), r2=247(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 144
LDI r2, 247
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
