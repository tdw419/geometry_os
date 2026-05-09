; DESCRIPTION: Composite: Places a black dot at position (461, 53) then Places a green 58x98 rectangle at position (376, 62).
; PLAN: r0=461(x), r1=53(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=62(y), r7=58(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 53
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 376
LDI r6, 62
LDI r7, 58
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
