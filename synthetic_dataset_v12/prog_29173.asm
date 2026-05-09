; DESCRIPTION: Composite: Places a red dot at position (47, 8) then Places a magenta 25x100 rectangle at position (478, 57).
; PLAN: r0=47(x), r1=8(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=478(x), r6=57(y), r7=25(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 8
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 478
LDI r6, 57
LDI r7, 25
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
