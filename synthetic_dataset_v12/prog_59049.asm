; DESCRIPTION: Composite: Places a black dot at position (137, 248) then Places a purple 40x119 rectangle at position (35, 33).
; PLAN: r0=137(x), r1=248(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=35(x), r6=33(y), r7=40(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 248
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 35
LDI r6, 33
LDI r7, 40
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
