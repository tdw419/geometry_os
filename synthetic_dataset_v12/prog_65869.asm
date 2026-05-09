; DESCRIPTION: Renders a purple line between points (242, 162) and (112, 95).
; PLAN: r0=242(x1), r1=162(y1), r2=112(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 162
LDI r2, 112
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
