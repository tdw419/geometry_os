; DESCRIPTION: Composite: Sets a single yellow pixel at (209, 11) then Renders a white box of size 11x116 starting at (217, 140).
; PLAN: r0=209(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=140(y), r7=11(width), r8=116(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 217
LDI r6, 140
LDI r7, 11
LDI r8, 116
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
