; DESCRIPTION: Composite: Creates a blue rectangular region at (360, 195) spanning 92 by 37 pixels then Places a red dot at position (386, 140).
; PLAN: r0=360(x), r1=195(y), r2=92(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=140(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 195
LDI r2, 92
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 140
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
