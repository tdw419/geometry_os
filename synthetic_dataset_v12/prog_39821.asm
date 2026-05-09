; DESCRIPTION: Composite: Places a orange dot at position (381, 31) then Places a green 70x81 rectangle at position (213, 89).
; PLAN: r0=381(x), r1=31(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=89(y), r7=70(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 31
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 213
LDI r6, 89
LDI r7, 70
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
