; DESCRIPTION: Composite: Renders a blue line between points (4, 40) and (143, 30) then Sets a single white pixel at (473, 71).
; PLAN: r0=4(x1), r1=40(y1), r2=143(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=71(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 40
LDI r2, 143
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 71
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
