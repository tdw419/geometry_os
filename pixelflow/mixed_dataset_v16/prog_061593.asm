; DESCRIPTION: Composite: Sets a single purple pixel at (472, 73) then Draws a orange rectangle at (189, 119) with width 57 and height 116.
; PLAN: r0=472(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=119(y), r7=57(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 73
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 119
LDI r7, 57
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
