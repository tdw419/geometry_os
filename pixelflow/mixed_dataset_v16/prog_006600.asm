; DESCRIPTION: Composite: Sets a single cyan pixel at (498, 93) then Creates a magenta rectangular region at (449, 155) spanning 17 by 59 pixels.
; PLAN: r0=498(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=449(x), r6=155(y), r7=17(width), r8=59(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 498
LDI r1, 93
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 449
LDI r6, 155
LDI r7, 17
LDI r8, 59
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
