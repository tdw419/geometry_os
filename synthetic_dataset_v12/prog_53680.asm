; DESCRIPTION: Composite: Sets a single purple pixel at (216, 223) then Places a orange 69x42 rectangle at position (11, 38).
; PLAN: r0=216(x), r1=223(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=38(y), r7=69(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 223
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 11
LDI r6, 38
LDI r7, 69
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
