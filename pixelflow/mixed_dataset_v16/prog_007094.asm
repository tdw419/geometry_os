; DESCRIPTION: Composite: Places a orange dot at position (194, 232) then Places a magenta 100x113 rectangle at position (407, 142).
; PLAN: r0=194(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=142(y), r7=100(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 407
LDI r6, 142
LDI r7, 100
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
