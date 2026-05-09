; DESCRIPTION: Composite: Sets a single blue pixel at (378, 147) then Places a white 59x74 rectangle at position (94, 142).
; PLAN: r0=378(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=142(y), r7=59(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 142
LDI r7, 59
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
