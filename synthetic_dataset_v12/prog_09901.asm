; DESCRIPTION: Composite: Renders a white line between points (279, 232) and (339, 135) then Places a purple dot at position (365, 126).
; PLAN: r0=279(x1), r1=232(y1), r2=339(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=126(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 232
LDI r2, 339
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 126
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
