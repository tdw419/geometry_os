; DESCRIPTION: Composite: Places a black 93x117 rectangle at position (339, 30) then Places a white dot at position (60, 100).
; PLAN: r0=339(x), r1=30(y), r2=93(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 30
LDI r2, 93
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
