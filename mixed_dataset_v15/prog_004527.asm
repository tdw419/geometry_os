; DESCRIPTION: Composite: Sets a single cyan pixel at (508, 130) then Creates a purple rectangular region at (240, 96) spanning 75 by 31 pixels.
; PLAN: r0=508(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=96(y), r7=75(width), r8=31(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 508
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 96
LDI r7, 75
LDI r8, 31
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
