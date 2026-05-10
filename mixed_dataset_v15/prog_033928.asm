; DESCRIPTION: Composite: Creates a yellow rectangular region at (389, 141) spanning 95 by 90 pixels then Places a magenta dot at position (260, 176).
; PLAN: r0=389(x), r1=141(y), r2=95(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=176(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 141
LDI r2, 95
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 176
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
