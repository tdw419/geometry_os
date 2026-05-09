; DESCRIPTION: Composite: Places a cyan 73x89 rectangle at position (32, 30) then Sets a single cyan pixel at (142, 117).
; PLAN: r0=32(x), r1=30(y), r2=73(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=117(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 30
LDI r2, 73
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 117
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
