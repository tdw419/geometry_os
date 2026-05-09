; DESCRIPTION: Composite: Creates a purple rectangular region at (45, 27) spanning 69 by 54 pixels then Places a white dot at position (159, 158).
; PLAN: r0=45(x), r1=27(y), r2=69(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=158(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 27
LDI r2, 69
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 158
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
