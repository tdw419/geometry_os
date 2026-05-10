; DESCRIPTION: Composite: Places a black 87x46 rectangle at position (237, 82) then Places a red dot at position (118, 81).
; PLAN: r0=237(x), r1=82(y), r2=87(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=81(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 82
LDI r2, 87
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 81
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
