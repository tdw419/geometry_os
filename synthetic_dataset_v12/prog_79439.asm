; DESCRIPTION: Composite: Sets a single orange pixel at (480, 15) then Renders a blue line between points (61, 126) and (257, 130).
; PLAN: r0=480(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=61(x1), r6=126(y1), r7=257(x2), r8=130(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 61
LDI r6, 126
LDI r7, 257
LDI r8, 130
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
