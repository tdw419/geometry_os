; DESCRIPTION: Composite: Sets a single black pixel at (293, 18) then Places a orange line segment connecting (442, 247) to (188, 19).
; PLAN: r0=293(x), r1=18(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=442(x1), r6=247(y1), r7=188(x2), r8=19(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 18
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 442
LDI r6, 247
LDI r7, 188
LDI r8, 19
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
