; DESCRIPTION: Composite: Sets a single red pixel at (278, 158) then Creates a red rectangular region at (327, 24) spanning 17 by 67 pixels.
; PLAN: r0=278(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=24(y), r7=17(width), r8=67(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 24
LDI r7, 17
LDI r8, 67
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
