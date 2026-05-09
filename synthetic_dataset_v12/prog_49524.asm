; DESCRIPTION: Composite: Places a orange dot at position (7, 238) then Creates a cyan rectangular region at (111, 107) spanning 44 by 27 pixels.
; PLAN: r0=7(x), r1=238(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=107(y), r7=44(width), r8=27(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 238
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 111
LDI r6, 107
LDI r7, 44
LDI r8, 27
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
