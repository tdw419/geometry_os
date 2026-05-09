; DESCRIPTION: Renders a purple line between points (82, 178) and (321, 189).
; PLAN: r0=82(x1), r1=178(y1), r2=321(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 178
LDI r2, 321
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
