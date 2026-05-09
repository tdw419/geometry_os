; DESCRIPTION: Renders a yellow line between points (194, 42) and (351, 209).
; PLAN: r0=194(x1), r1=42(y1), r2=351(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 42
LDI r2, 351
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
