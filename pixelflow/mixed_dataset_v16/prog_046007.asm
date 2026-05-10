; DESCRIPTION: Composite: Places a red 105x72 rectangle at position (7, 184) then Places a black dot at position (194, 150).
; PLAN: r0=7(x), r1=184(y), r2=105(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=150(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 184
LDI r2, 105
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 150
LDI r7, 0x000000
PSET r5, r6, r7
HALT
