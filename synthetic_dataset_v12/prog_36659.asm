; DESCRIPTION: Composite: Sets a single red pixel at (394, 217) then Renders a red box of size 12x118 starting at (419, 128).
; PLAN: r0=394(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=128(y), r7=12(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 419
LDI r6, 128
LDI r7, 12
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
