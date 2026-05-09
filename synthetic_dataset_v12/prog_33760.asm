; DESCRIPTION: Composite: Places a white 90x28 rectangle at position (10, 95) then Sets a single blue pixel at (360, 179).
; PLAN: r0=10(x), r1=95(y), r2=90(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=179(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 10
LDI r1, 95
LDI r2, 90
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 179
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
