; DESCRIPTION: Composite: Sets a single orange pixel at (140, 204) then Places a blue 79x95 rectangle at position (1, 53).
; PLAN: r0=140(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=53(y), r7=79(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 204
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 1
LDI r6, 53
LDI r7, 79
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
