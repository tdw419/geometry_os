; DESCRIPTION: Composite: Renders a purple line between points (370, 168) and (338, 2) then Places a purple dot at position (230, 153).
; PLAN: r0=370(x1), r1=168(y1), r2=338(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=153(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 168
LDI r2, 338
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 153
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
