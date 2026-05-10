; DESCRIPTION: Composite: Sets a single red pixel at (409, 236) then Places a orange 76x79 rectangle at position (32, 99).
; PLAN: r0=409(x), r1=236(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=99(y), r7=76(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 236
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 32
LDI r6, 99
LDI r7, 76
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
