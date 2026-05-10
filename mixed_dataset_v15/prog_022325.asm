; DESCRIPTION: Renders a blue line between points (318, 143) and (341, 27).
; PLAN: r0=318(x1), r1=143(y1), r2=341(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 143
LDI r2, 341
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
