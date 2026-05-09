; DESCRIPTION: Composite: Sets a single red pixel at (119, 148) then Places a orange 115x82 rectangle at position (167, 153).
; PLAN: r0=119(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=153(y), r7=115(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 148
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 167
LDI r6, 153
LDI r7, 115
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
