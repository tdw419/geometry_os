; DESCRIPTION: Composite: Creates a cyan rectangular region at (49, 80) spanning 24 by 63 pixels then Places a cyan dot at position (68, 143).
; PLAN: r0=49(x), r1=80(y), r2=24(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=143(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 49
LDI r1, 80
LDI r2, 24
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 143
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
