; DESCRIPTION: Composite: Creates a black rectangular region at (285, 25) spanning 100 by 63 pixels then Places a red dot at position (79, 158).
; PLAN: r0=285(x), r1=25(y), r2=100(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=158(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 25
LDI r2, 100
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 158
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
