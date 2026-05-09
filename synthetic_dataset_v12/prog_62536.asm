; DESCRIPTION: Composite: Sets a single white pixel at (451, 250) then Places a cyan line segment connecting (3, 166) to (136, 27).
; PLAN: r0=451(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=166(y1), r7=136(x2), r8=27(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 250
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 166
LDI r7, 136
LDI r8, 27
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
