; DESCRIPTION: Renders a purple line between points (178, 194) and (345, 240).
; PLAN: r0=178(x1), r1=194(y1), r2=345(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 194
LDI r2, 345
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
