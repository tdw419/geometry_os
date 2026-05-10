; DESCRIPTION: Composite: Places a blue 91x91 rectangle at position (173, 17) then Sets a single blue pixel at (62, 139).
; PLAN: r0=173(x), r1=17(y), r2=91(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=139(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 17
LDI r2, 91
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 139
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
