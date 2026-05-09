; DESCRIPTION: Composite: Sets a single red pixel at (74, 118) then Creates a blue rectangular region at (308, 143) spanning 105 by 67 pixels.
; PLAN: r0=74(x), r1=118(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=143(y), r7=105(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 118
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 308
LDI r6, 143
LDI r7, 105
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
