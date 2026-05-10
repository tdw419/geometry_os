; DESCRIPTION: Composite: Places a yellow dot at position (312, 126) then Creates a white rectangular region at (299, 44) spanning 30 by 42 pixels.
; PLAN: r0=312(x), r1=126(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=44(y), r7=30(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 126
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 299
LDI r6, 44
LDI r7, 30
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
