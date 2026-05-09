; DESCRIPTION: Composite: Creates a cyan rectangular region at (431, 124) spanning 72 by 110 pixels then Places a white dot at position (509, 93).
; PLAN: r0=431(x), r1=124(y), r2=72(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x), r6=93(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 124
LDI r2, 72
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 93
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
