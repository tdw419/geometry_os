; DESCRIPTION: Composite: Places a cyan 95x108 rectangle at position (261, 27) then Sets a single yellow pixel at (195, 134).
; PLAN: r0=261(x), r1=27(y), r2=95(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=134(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 261
LDI r1, 27
LDI r2, 95
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 134
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
