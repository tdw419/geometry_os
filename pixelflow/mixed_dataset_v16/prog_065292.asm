; DESCRIPTION: Composite: Sets a single cyan pixel at (419, 209) then Creates a cyan rectangular region at (0, 181) spanning 21 by 64 pixels.
; PLAN: r0=419(x), r1=209(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=181(y), r7=21(width), r8=64(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 209
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 0
LDI r6, 181
LDI r7, 21
LDI r8, 64
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
