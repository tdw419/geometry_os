; DESCRIPTION: Composite: Creates a black rectangular region at (429, 58) spanning 39 by 109 pixels then Places a cyan dot at position (308, 251).
; PLAN: r0=429(x), r1=58(y), r2=39(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=251(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 429
LDI r1, 58
LDI r2, 39
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 251
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
