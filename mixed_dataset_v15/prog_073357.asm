; DESCRIPTION: Composite: Creates a white rectangular region at (4, 115) spanning 49 by 112 pixels then Places a red dot at position (430, 154).
; PLAN: r0=4(x), r1=115(y), r2=49(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=154(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 115
LDI r2, 49
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 154
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
