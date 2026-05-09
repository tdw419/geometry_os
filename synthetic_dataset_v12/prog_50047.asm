; DESCRIPTION: Composite: Places a white dot at position (381, 147) then Creates a black rectangular region at (466, 62) spanning 12 by 41 pixels.
; PLAN: r0=381(x), r1=147(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=466(x), r6=62(y), r7=12(width), r8=41(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 147
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 466
LDI r6, 62
LDI r7, 12
LDI r8, 41
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
