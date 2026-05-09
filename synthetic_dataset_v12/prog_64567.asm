; DESCRIPTION: Composite: Places a cyan 97x66 rectangle at position (163, 59) then Sets a single yellow pixel at (332, 223).
; PLAN: r0=163(x), r1=59(y), r2=97(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=223(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 59
LDI r2, 97
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 223
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
