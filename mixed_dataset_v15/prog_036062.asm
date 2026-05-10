; DESCRIPTION: Renders a purple line between points (321, 1) and (242, 96).
; PLAN: r0=321(x1), r1=1(y1), r2=242(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 1
LDI r2, 242
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
