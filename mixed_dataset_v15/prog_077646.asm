; DESCRIPTION: Composite: Creates a white rectangular region at (348, 63) spanning 48 by 92 pixels then Places a red dot at position (166, 132).
; PLAN: r0=348(x), r1=63(y), r2=48(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=132(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 348
LDI r1, 63
LDI r2, 48
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 132
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
