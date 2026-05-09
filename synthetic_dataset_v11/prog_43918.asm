; DESCRIPTION: Renders a purple line between points (161, 242) and (138, 30).
; PLAN: r0=161(x1), r1=242(y1), r2=138(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 242
LDI r2, 138
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
