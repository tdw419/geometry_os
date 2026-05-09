; DESCRIPTION: Composite: Renders a blue line between points (299, 32) and (473, 230) then Sets a single black pixel at (105, 56).
; PLAN: r0=299(x1), r1=32(y1), r2=473(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=56(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 32
LDI r2, 473
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 56
LDI r7, 0x000000
PSET r5, r6, r7
HALT
