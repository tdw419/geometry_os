; DESCRIPTION: Composite: Sets a single magenta pixel at (332, 1) then Creates a black rectangular region at (24, 171) spanning 35 by 31 pixels.
; PLAN: r0=332(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=171(y), r7=35(width), r8=31(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 171
LDI r7, 35
LDI r8, 31
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
