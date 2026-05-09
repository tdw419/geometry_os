; DESCRIPTION: Composite: Places a black 81x38 rectangle at position (120, 169) then Places a black dot at position (452, 248).
; PLAN: r0=120(x), r1=169(y), r2=81(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=248(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 169
LDI r2, 81
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 248
LDI r7, 0x000000
PSET r5, r6, r7
HALT
