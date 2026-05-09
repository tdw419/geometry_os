; DESCRIPTION: Composite: Places a orange dot at position (381, 101) then Places a magenta 88x74 rectangle at position (55, 42).
; PLAN: r0=381(x), r1=101(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=55(x), r6=42(y), r7=88(width), r8=74(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 101
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 55
LDI r6, 42
LDI r7, 88
LDI r8, 74
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
