; DESCRIPTION: Composite: Places a cyan dot at position (486, 175) then Creates a white rectangular region at (279, 119) spanning 119 by 74 pixels.
; PLAN: r0=486(x), r1=175(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=119(y), r7=119(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 175
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 119
LDI r7, 119
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
