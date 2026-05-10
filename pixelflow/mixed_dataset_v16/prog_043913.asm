; DESCRIPTION: Composite: Sets a single red pixel at (442, 139) then Places a blue 115x81 rectangle at position (63, 55).
; PLAN: r0=442(x), r1=139(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=55(y), r7=115(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 139
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 63
LDI r6, 55
LDI r7, 115
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
