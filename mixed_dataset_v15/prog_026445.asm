; DESCRIPTION: Composite: Places a cyan 37x93 rectangle at position (57, 111) then Sets a single cyan pixel at (316, 23).
; PLAN: r0=57(x), r1=111(y), r2=37(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 111
LDI r2, 37
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
