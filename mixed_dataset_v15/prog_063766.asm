; DESCRIPTION: Renders a purple line between points (87, 96) and (27, 204).
; PLAN: r0=87(x1), r1=96(y1), r2=27(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 96
LDI r2, 27
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
