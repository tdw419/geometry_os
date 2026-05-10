; DESCRIPTION: Composite: Places a purple dot at position (40, 7) then Creates a white rectangular region at (49, 149) spanning 10 by 13 pixels.
; PLAN: r0=40(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=149(y), r7=10(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 149
LDI r7, 10
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
