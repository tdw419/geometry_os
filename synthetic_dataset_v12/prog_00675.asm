; DESCRIPTION: Composite: Places a white 63x30 rectangle at position (115, 117) then Sets a single cyan pixel at (407, 145).
; PLAN: r0=115(x), r1=117(y), r2=63(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=145(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 115
LDI r1, 117
LDI r2, 63
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 145
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
