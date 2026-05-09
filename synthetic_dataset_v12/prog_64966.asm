; DESCRIPTION: Composite: Places a purple dot at position (94, 43) then Places a black line segment connecting (405, 94) to (372, 116).
; PLAN: r0=94(x), r1=43(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=405(x1), r6=94(y1), r7=372(x2), r8=116(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 43
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 94
LDI r7, 372
LDI r8, 116
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
