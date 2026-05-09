; DESCRIPTION: Composite: Draws a white rectangle at (304, 74) with width 53 and height 118 then Sets a single red pixel at (182, 177).
; PLAN: r0=304(x), r1=74(y), r2=53(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=177(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 74
LDI r2, 53
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 177
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
