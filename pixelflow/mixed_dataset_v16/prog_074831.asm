; DESCRIPTION: Composite: Sets a single orange pixel at (280, 236) then Creates a cyan rectangular region at (412, 83) spanning 86 by 58 pixels.
; PLAN: r0=280(x), r1=236(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=83(y), r7=86(width), r8=58(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 236
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 412
LDI r6, 83
LDI r7, 86
LDI r8, 58
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
