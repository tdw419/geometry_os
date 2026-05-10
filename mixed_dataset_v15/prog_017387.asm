; DESCRIPTION: Composite: Creates a orange rectangular region at (336, 29) spanning 116 by 49 pixels then Places a magenta dot at position (384, 23).
; PLAN: r0=336(x), r1=29(y), r2=116(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=23(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 29
LDI r2, 116
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 23
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
