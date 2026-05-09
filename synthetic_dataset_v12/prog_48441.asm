; DESCRIPTION: Composite: Places a cyan dot at position (386, 49) then Creates a white rectangular region at (46, 46) spanning 99 by 64 pixels.
; PLAN: r0=386(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=46(y), r7=99(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 46
LDI r7, 99
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
