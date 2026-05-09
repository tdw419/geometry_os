; DESCRIPTION: Composite: Places a magenta dot at position (263, 94) then Places a magenta 106x15 rectangle at position (96, 61).
; PLAN: r0=263(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=61(y), r7=106(width), r8=15(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 61
LDI r7, 106
LDI r8, 15
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
