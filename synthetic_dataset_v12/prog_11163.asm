; DESCRIPTION: Composite: Places a red 78x117 rectangle at position (311, 27) then Sets a single yellow pixel at (56, 202).
; PLAN: r0=311(x), r1=27(y), r2=78(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=202(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 27
LDI r2, 78
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 202
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
