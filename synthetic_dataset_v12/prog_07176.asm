; DESCRIPTION: Composite: Places a magenta dot at position (375, 50) then Places a green 11x95 rectangle at position (34, 50).
; PLAN: r0=375(x), r1=50(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=34(x), r6=50(y), r7=11(width), r8=95(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 50
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 34
LDI r6, 50
LDI r7, 11
LDI r8, 95
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
