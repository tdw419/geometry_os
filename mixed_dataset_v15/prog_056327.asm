; DESCRIPTION: Composite: Creates a purple rectangular region at (180, 90) spanning 119 by 98 pixels then Places a purple dot at position (109, 167).
; PLAN: r0=180(x), r1=90(y), r2=119(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=167(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 90
LDI r2, 119
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 167
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
