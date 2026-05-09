; DESCRIPTION: Composite: Sets a single black pixel at (466, 92) then Places a black line segment connecting (286, 86) to (399, 246).
; PLAN: r0=466(x), r1=92(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=286(x1), r6=86(y1), r7=399(x2), r8=246(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 92
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 286
LDI r6, 86
LDI r7, 399
LDI r8, 246
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
