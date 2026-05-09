; DESCRIPTION: Composite: Creates a green rectangular region at (184, 183) spanning 55 by 44 pixels then Places a cyan dot at position (283, 70).
; PLAN: r0=184(x), r1=183(y), r2=55(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=70(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 183
LDI r2, 55
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 70
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
