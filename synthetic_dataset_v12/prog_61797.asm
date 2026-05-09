; DESCRIPTION: Composite: Creates a white rectangular region at (298, 7) spanning 117 by 105 pixels then Places a purple dot at position (76, 83).
; PLAN: r0=298(x), r1=7(y), r2=117(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=83(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 7
LDI r2, 117
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 83
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
