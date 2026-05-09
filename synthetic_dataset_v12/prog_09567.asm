; DESCRIPTION: Composite: Places a black dot at position (266, 22) then Places a white 101x22 rectangle at position (47, 156).
; PLAN: r0=266(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=156(y), r7=101(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 47
LDI r6, 156
LDI r7, 101
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
