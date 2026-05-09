; DESCRIPTION: Renders a purple line between points (498, 242) and (377, 250).
; PLAN: r0=498(x1), r1=242(y1), r2=377(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 242
LDI r2, 377
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
