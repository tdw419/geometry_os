; DESCRIPTION: Renders a purple line between points (286, 166) and (511, 32).
; PLAN: r0=286(x1), r1=166(y1), r2=511(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 166
LDI r2, 511
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
