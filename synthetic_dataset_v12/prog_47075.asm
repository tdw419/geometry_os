; DESCRIPTION: Composite: Sets a single red pixel at (381, 249) then Draws a red rectangle at (341, 60) with width 120 and height 86.
; PLAN: r0=381(x), r1=249(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=60(y), r7=120(width), r8=86(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 249
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 341
LDI r6, 60
LDI r7, 120
LDI r8, 86
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
