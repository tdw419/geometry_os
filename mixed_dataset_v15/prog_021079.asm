; DESCRIPTION: Composite: Places a black 118x38 rectangle at position (251, 45) then Places a black dot at position (17, 246).
; PLAN: r0=251(x), r1=45(y), r2=118(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=246(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 45
LDI r2, 118
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 246
LDI r7, 0x000000
PSET r5, r6, r7
HALT
