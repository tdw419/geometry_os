; DESCRIPTION: Composite: Sets a single magenta pixel at (461, 216) then Places a white 66x57 rectangle at position (412, 183).
; PLAN: r0=461(x), r1=216(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=183(y), r7=66(width), r8=57(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 216
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 412
LDI r6, 183
LDI r7, 66
LDI r8, 57
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
