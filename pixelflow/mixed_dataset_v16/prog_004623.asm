; DESCRIPTION: Composite: Creates a white rectangular region at (409, 87) spanning 30 by 23 pixels then Places a red dot at position (381, 27).
; PLAN: r0=409(x), r1=87(y), r2=30(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=27(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 87
LDI r2, 30
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 27
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
