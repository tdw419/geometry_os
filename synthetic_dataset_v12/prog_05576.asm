; DESCRIPTION: Composite: Creates a red rectangular region at (347, 134) spanning 93 by 117 pixels then Places a blue dot at position (486, 181).
; PLAN: r0=347(x), r1=134(y), r2=93(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x), r6=181(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 347
LDI r1, 134
LDI r2, 93
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 181
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
