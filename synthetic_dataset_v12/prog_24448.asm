; DESCRIPTION: Composite: Creates a yellow rectangular region at (419, 139) spanning 12 by 94 pixels then Sets a single cyan pixel at (86, 154).
; PLAN: r0=419(x), r1=139(y), r2=12(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=154(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 139
LDI r2, 12
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 154
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
