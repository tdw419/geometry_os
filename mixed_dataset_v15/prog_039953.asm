; DESCRIPTION: Composite: Creates a orange rectangular region at (155, 129) spanning 69 by 115 pixels then Places a purple dot at position (365, 116).
; PLAN: r0=155(x), r1=129(y), r2=69(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=116(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 129
LDI r2, 69
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 116
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
