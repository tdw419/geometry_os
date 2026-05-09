; DESCRIPTION: Composite: Sets a single black pixel at (222, 68) then Places a green 81x48 rectangle at position (124, 120).
; PLAN: r0=222(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=120(y), r7=81(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 68
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 124
LDI r6, 120
LDI r7, 81
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
