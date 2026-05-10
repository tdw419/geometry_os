; DESCRIPTION: Composite: Places a blue dot at position (119, 168) then Creates a white rectangular region at (83, 82) spanning 97 by 101 pixels.
; PLAN: r0=119(x), r1=168(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=82(y), r7=97(width), r8=101(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 168
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 82
LDI r7, 97
LDI r8, 101
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
