; DESCRIPTION: Composite: Sets a single white pixel at (324, 249) then Creates a white rectangular region at (358, 96) spanning 82 by 32 pixels.
; PLAN: r0=324(x), r1=249(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=96(y), r7=82(width), r8=32(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 249
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 96
LDI r7, 82
LDI r8, 32
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
