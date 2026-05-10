; DESCRIPTION: Composite: Places a orange dot at position (452, 14) then Places a blue 50x75 rectangle at position (85, 117).
; PLAN: r0=452(x), r1=14(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=117(y), r7=50(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 14
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 85
LDI r6, 117
LDI r7, 50
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
