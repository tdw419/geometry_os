; DESCRIPTION: Composite: Sets a single blue pixel at (67, 93) then Places a green 109x104 rectangle at position (107, 39).
; PLAN: r0=67(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=39(y), r7=109(width), r8=104(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 93
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 39
LDI r7, 109
LDI r8, 104
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
