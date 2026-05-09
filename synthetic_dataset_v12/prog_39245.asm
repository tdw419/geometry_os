; DESCRIPTION: Composite: Places a purple dot at position (477, 82) then Places a blue line segment connecting (113, 80) to (165, 82).
; PLAN: r0=477(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=113(x1), r6=80(y1), r7=165(x2), r8=82(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 82
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 113
LDI r6, 80
LDI r7, 165
LDI r8, 82
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
