; DESCRIPTION: Renders a blue line between points (381, 194) and (184, 156).
; PLAN: r0=381(x1), r1=194(y1), r2=184(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 194
LDI r2, 184
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
