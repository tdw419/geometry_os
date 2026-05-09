; DESCRIPTION: Composite: Places a orange dot at position (376, 66) then Creates a cyan rectangular region at (197, 111) spanning 49 by 54 pixels.
; PLAN: r0=376(x), r1=66(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=111(y), r7=49(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 66
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 197
LDI r6, 111
LDI r7, 49
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
