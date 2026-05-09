; DESCRIPTION: Composite: Sets a single magenta pixel at (139, 92) then Renders a white box of size 33x107 starting at (434, 121).
; PLAN: r0=139(x), r1=92(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=121(y), r7=33(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 92
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 121
LDI r7, 33
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
