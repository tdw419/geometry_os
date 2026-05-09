; DESCRIPTION: Composite: Creates a red rectangular region at (14, 88) spanning 114 by 95 pixels then Places a magenta dot at position (469, 128).
; PLAN: r0=14(x), r1=88(y), r2=114(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x), r6=128(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 14
LDI r1, 88
LDI r2, 114
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 128
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
