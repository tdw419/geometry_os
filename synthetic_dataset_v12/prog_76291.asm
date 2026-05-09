; DESCRIPTION: Composite: Sets a single cyan pixel at (77, 174) then Creates a orange rectangular region at (127, 93) spanning 93 by 14 pixels.
; PLAN: r0=77(x), r1=174(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=93(y), r7=93(width), r8=14(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 174
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 93
LDI r7, 93
LDI r8, 14
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
