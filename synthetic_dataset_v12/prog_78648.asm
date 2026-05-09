; DESCRIPTION: Composite: Creates a red rectangular region at (59, 68) spanning 116 by 23 pixels then Places a white dot at position (56, 201).
; PLAN: r0=59(x), r1=68(y), r2=116(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=201(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 59
LDI r1, 68
LDI r2, 116
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 201
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
