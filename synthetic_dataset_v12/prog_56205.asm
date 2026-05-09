; DESCRIPTION: Composite: Creates a magenta rectangular region at (353, 73) spanning 34 by 119 pixels then Places a magenta dot at position (405, 5).
; PLAN: r0=353(x), r1=73(y), r2=34(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=5(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 73
LDI r2, 34
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 5
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
