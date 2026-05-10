; DESCRIPTION: Composite: Renders a blue line between points (320, 143) and (81, 88) then Sets a single magenta pixel at (453, 205).
; PLAN: r0=320(x1), r1=143(y1), r2=81(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=205(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 143
LDI r2, 81
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 205
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
