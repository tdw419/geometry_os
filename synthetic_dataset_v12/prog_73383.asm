; DESCRIPTION: Composite: Creates a white rectangular region at (79, 56) spanning 112 by 78 pixels then Places a blue dot at position (1, 239).
; PLAN: r0=79(x), r1=56(y), r2=112(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=239(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 79
LDI r1, 56
LDI r2, 112
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 239
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
