; DESCRIPTION: Composite: Sets a single purple pixel at (351, 32) then Renders a white line between points (268, 54) and (501, 3).
; PLAN: r0=351(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=268(x1), r6=54(y1), r7=501(x2), r8=3(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 268
LDI r6, 54
LDI r7, 501
LDI r8, 3
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
