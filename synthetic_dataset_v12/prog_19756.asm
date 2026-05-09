; DESCRIPTION: Composite: Sets a single magenta pixel at (373, 200) then Places a red 14x26 rectangle at position (167, 112).
; PLAN: r0=373(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=112(y), r7=14(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 200
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 112
LDI r7, 14
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
