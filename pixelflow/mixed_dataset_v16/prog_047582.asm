; DESCRIPTION: Composite: Sets a single green pixel at (354, 80) then Places a orange 91x79 rectangle at position (134, 84).
; PLAN: r0=354(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=134(x), r6=84(y), r7=91(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 134
LDI r6, 84
LDI r7, 91
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
