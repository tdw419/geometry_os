; DESCRIPTION: Composite: Sets a single orange pixel at (134, 174) then Places a magenta 27x58 rectangle at position (233, 184).
; PLAN: r0=134(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=184(y), r7=27(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 174
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 233
LDI r6, 184
LDI r7, 27
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
