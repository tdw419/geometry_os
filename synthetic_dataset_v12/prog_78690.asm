; DESCRIPTION: Composite: Sets a single black pixel at (292, 207) then Draws a blue line from (257, 21) to (375, 140).
; PLAN: r0=292(x), r1=207(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=257(x1), r6=21(y1), r7=375(x2), r8=140(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 207
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 257
LDI r6, 21
LDI r7, 375
LDI r8, 140
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
