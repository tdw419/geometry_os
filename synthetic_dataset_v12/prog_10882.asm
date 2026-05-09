; DESCRIPTION: Composite: Sets a single cyan pixel at (373, 161) then Creates a cyan rectangular region at (229, 58) spanning 63 by 18 pixels.
; PLAN: r0=373(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=58(y), r7=63(width), r8=18(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 161
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 229
LDI r6, 58
LDI r7, 63
LDI r8, 18
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
