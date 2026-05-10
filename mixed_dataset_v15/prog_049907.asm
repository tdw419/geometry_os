; DESCRIPTION: Composite: Sets a single black pixel at (381, 189) then Places a cyan 32x77 rectangle at position (450, 31).
; PLAN: r0=381(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=31(y), r7=32(width), r8=77(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 189
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 450
LDI r6, 31
LDI r7, 32
LDI r8, 77
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
