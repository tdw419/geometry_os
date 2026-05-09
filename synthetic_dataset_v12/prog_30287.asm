; DESCRIPTION: Composite: Places a yellow dot at position (324, 5) then Places a black line segment connecting (261, 12) to (29, 116).
; PLAN: r0=324(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=261(x1), r6=12(y1), r7=29(x2), r8=116(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 261
LDI r6, 12
LDI r7, 29
LDI r8, 116
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
