; DESCRIPTION: Composite: Sets a single blue pixel at (244, 84) then Places a cyan 93x32 rectangle at position (48, 56).
; PLAN: r0=244(x), r1=84(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=56(y), r7=93(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 84
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 48
LDI r6, 56
LDI r7, 93
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
