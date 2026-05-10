; DESCRIPTION: Composite: Places a orange dot at position (265, 87) then Places a blue 84x115 rectangle at position (221, 79).
; PLAN: r0=265(x), r1=87(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=79(y), r7=84(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 87
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 221
LDI r6, 79
LDI r7, 84
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
