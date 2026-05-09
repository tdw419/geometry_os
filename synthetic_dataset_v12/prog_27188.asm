; DESCRIPTION: Composite: Sets a single purple pixel at (351, 118) then Renders a cyan line between points (142, 148) and (53, 50).
; PLAN: r0=351(x), r1=118(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=142(x1), r6=148(y1), r7=53(x2), r8=50(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 118
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 142
LDI r6, 148
LDI r7, 53
LDI r8, 50
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
