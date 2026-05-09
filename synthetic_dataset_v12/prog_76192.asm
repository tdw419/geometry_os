; DESCRIPTION: Composite: Sets a single blue pixel at (64, 100) then Places a black 28x22 rectangle at position (149, 61).
; PLAN: r0=64(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=61(y), r7=28(width), r8=22(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 61
LDI r7, 28
LDI r8, 22
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
