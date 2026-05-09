; DESCRIPTION: Composite: Sets a single black pixel at (110, 32) then Renders a yellow line between points (28, 89) and (343, 166).
; PLAN: r0=110(x), r1=32(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=28(x1), r6=89(y1), r7=343(x2), r8=166(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 32
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 28
LDI r6, 89
LDI r7, 343
LDI r8, 166
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
