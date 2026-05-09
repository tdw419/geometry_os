; DESCRIPTION: Renders a purple line between points (458, 134) and (449, 242).
; PLAN: r0=458(x1), r1=134(y1), r2=449(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 134
LDI r2, 449
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
