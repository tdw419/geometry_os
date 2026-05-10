; DESCRIPTION: Composite: Sets a single white pixel at (67, 253) then Creates a white rectangular region at (358, 37) spanning 104 by 35 pixels.
; PLAN: r0=67(x), r1=253(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=37(y), r7=104(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 253
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 37
LDI r7, 104
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
